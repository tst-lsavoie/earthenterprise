#!/bin/bash

# Some of the Gauge tests cannot clean up after themselves because deleting
# assets requires superuser permissions. This script can be used to clean up
# after the tests instead.
export ASSETROOT=/gevol/assets
export SRC_VOLUME=/gevol/src 
export TEST_DATA_PATH=${SRC_VOLUME}/gauge_tests

sudo rm -rf ${ASSETROOT}/Databases/Database*
sudo rm -rf ${ASSETROOT}/MapLayers/StatePropagationTest*
sudo rm -rf ${ASSETROOT}/Projects/Imagery/StatePropagationTest*
sudo rm -rf ${ASSETROOT}/Projects/Terrain/StatePropagationTest*
sudo rm -rf ${ASSETROOT}/Projects/Vector/StatePropagationTest*
sudo rm -rf ${ASSETROOT}/Projects/Map/StatePropagationTest*
sudo rm -rf ${ASSETROOT}/Projects/Imagery/BadImagery*
sudo rm -rf ${ASSETROOT}/Resources/Imagery/BlueMarble*
sudo rm -rf ${ASSETROOT}/Resources/Imagery/i3SF15meter*
sudo rm -rf ${ASSETROOT}/Resources/Imagery/USGSLanSat*
sudo rm -rf ${ASSETROOT}/Resources/Imagery/BadImage*
sudo rm -rf ${ASSETROOT}/Resources/Imagery/SFHiRes*
sudo rm -rf ${ASSETROOT}/Resources/Terrain/GTopo_Database*
sudo rm -rf ${ASSETROOT}/Resources/Vector/CA_POIs_* 
sudo /etc/init.d/gefusion restart

#create assets that will fail when fusing, to synthesize bad projects. 
#genewimageryresource -o Imagery/BadTestImage1 ${TEST_DATA_PATH}/Imagery/usgsSFHiRes.tif
##genewimageryresource -o Imagery/BadTestImage2 ${TEST_DATA_PATH}/Imagery/usgsLanSat.jp2
#genewimageryproject -o Projects/Imagery/BadImagery Imagery/BadTestImage1 Imagery/BadTestImage2
#gebuild Projects/Imagery/BadImagery 


