pkgname=xtensa-esp32s2-elf-gcc-bin
pkgver=8.4.0_esp32s2_2021r2
pkgrel=1
pkgdesc="ESP32-S2 Toolchain"
arch=('x86_64')
depends=('glibc' 'gcc' 'git' 'make' 'ncurses' 'flex' 'bison' 'gperf' 'python2-pyserial' 'python2-cryptography' 'python2-pyparsing')
url="https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html"
# see https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-tools.html#xtensa-esp32s2-elf
source=("https://github.com/espressif/crosstool-NG/releases/download/esp-2021r2/xtensa-esp32s2-elf-gcc8_4_0-esp-2021r2-linux-amd64.tar.gz")
license=('GPL' 'LGPL')
options=(!strip staticlibs)
sha256sums=('a6e0947c92b823ca04f062522249f0a428357e0b056f1ff4c6bcabef83cf63a7')

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
