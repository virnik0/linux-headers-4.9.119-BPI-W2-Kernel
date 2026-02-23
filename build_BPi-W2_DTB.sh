#!/bin/bash
cd /usr/src/linux-headers-4.9.119-BPI-W2-Kernel/
cpp -nostdinc -Iinclude -Iarch/arm64/boot/dts -Iarch/arm64/boot/dts/realtek -undef -D__DTS__ -x assembler-with-cpp arch/arm64/boot/dts/realtek/rtd129x/rtd-1296-bananapi-w2-2GB.dts > combined.dts
dtc -I dts -O dtb -p 16384 -i arch/arm64/boot/dts/realtek -i arch/arm64/boot/dts/realtek/rtd129x -o rtd-1296-bananapi-w2-2GB.dtb combined.dts
rm -f combined.dts
rm -rf output/boot
mkdir -p output/boot/bananapi/bpi-w2/linux/
mv rtd-1296-bananapi-w2-2GB.dtb output/boot/bananapi/bpi-w2/linux/
