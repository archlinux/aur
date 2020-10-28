# Maintainer: Kurt McAlpine <kurt@linux.com>
# Contributor: Michael Zimmermann <sigmaepsilon92@gmail.com>
# Contributor: James Duley <jagduley gmail>
# Contributor: 2bluesc <2bluesc gmail.com>
# Contributor: Vadzim Dambrouski <pftbest gmail.com>
pkgname=xtensa-esp32-elf-gcc-bin
pkgver=8.4.0_esp32_2020r3
pkgrel=1
pkgdesc="ESP32 Toolchain"
arch=('x86_64')
depends=('glibc' 'gcc' 'git' 'make' 'ncurses' 'flex' 'bison' 'gperf' 'python2-pyserial' 'python2-cryptography' 'python2-pyparsing')
conflicts=('gcc-xtensa-esp32-elf-bin')
url="https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html"
# see https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-tools.html#xtensa-esp32-elf
source=("https://dl.espressif.com/dl/xtensa-esp32-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz")
license=('GPL' 'LGPL')
options=(!strip staticlibs)
sha256sums=('674080a12f9c5ebe5a3a5ce51c6deaeffe6dfb06d6416233df86f25b574e9279')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/xtensa-esp32-elf/
  cp -a * $pkgdir/usr
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/share
  rm -rf $pkgdir/usr/lib/libcc1.so*
}
