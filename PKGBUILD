pkgname=xtensa-esp32s2-elf-gcc-bin
pkgver=8.4.0_esp32s2_2020r4
pkgrel=1
pkgdesc="ESP32-S2 Toolchain"
arch=('x86_64')
depends=('glibc' 'gcc' 'git' 'make' 'ncurses' 'flex' 'bison' 'gperf' 'python2-pyserial' 'python2-cryptography' 'python2-pyparsing')
url="https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html"
# see https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-tools.html#xtensa-esp32s2-elf
source=("https://github.com/espressif/crosstool-NG/releases/download/esp-2020r3/xtensa-esp32s2-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz")
license=('GPL' 'LGPL')
options=(!strip staticlibs)
sha256sums=('40fafa47045167feda0cd07827db5207ebfeb4a3b6b24475957a921bc92805ed')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/xtensa-esp32s2-elf/
  cp -a * $pkgdir/usr
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/share
  rm -rf $pkgdir/usr/share
  rm -rf $pkgdir/usr/lib/ldscripts/elf32xtensa.* # TODO: this conflicts with xtensa-esp32s2
  rm -rf $pkgdir/usr/lib/libcc1.so*
}
