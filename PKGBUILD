# Maintainer: Kurt McAlpine <kurt@linux.com>
# Contributor: Michael Zimmermann <sigmaepsilon92@gmail.com>
# Contributor: James Duley <jagduley gmail>
# Contributor: 2bluesc <2bluesc gmail.com>
# Contributor: Vadzim Dambrouski <pftbest gmail.com>
pkgname=xtensa-esp32-elf-gcc-bin
pkgver=8.2.0_esp32_2019r1
pkgrel=1
pkgdesc="ESP32 Toolchain"
arch=('x86_64')
depends=('glibc' 'gcc' 'git' 'make' 'ncurses' 'flex' 'bison' 'gperf' 'python2-pyserial' 'python2-cryptography' 'python2-future' 'python2-pyparsing' 'python2-pyelftools')
conflicts=('gcc-xtensa-esp32-elf-bin')
url="https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html"
source=("https://dl.espressif.com/dl/xtensa-esp32-elf-gcc8_2_0-esp32-2019r1-linux-amd64.tar.gz")
license=('GPL' 'LGPL')
options=(!strip staticlibs)
sha256sums=('39db59b13f25e83e53c55f56979dbfce77b7f23126ad79de833509ad902d3f0a')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/xtensa-esp32-elf/
  cp -a * $pkgdir/usr
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/share
  rm -rf $pkgdir/usr/lib/libcc1.so*
}
