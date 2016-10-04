# Original Maintainer: James Duley <jagduley gmail>
# Previous Maintainer: 2bluesc <2bluesc gmail.com>
# Maintainer: Vadzim Dambrouski <pftbest gmail.com>
pkgname=gcc-arm-none-eabi-bin
pkgver=5_2016_q3_update
pkgrel=1
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes newlib, does NOT include GDB)"
arch=('i686' 'x86_64')
if [ "${CARCH}" = "x86_64" ]; then
    depends=('lib32-glibc')
else
    depends=('glibc')
fi
optdepends=(
	  'arm-none-eabi-gdb: GNU Debugger for ARM EABI'
    )
provides=('gcc-arm-none-eabi'
	  'arm-none-eabi-gcc'
	  'arm-none-eabi-binutils'
	  'arm-none-eabi-newlib'
    )
conflicts=('gcc-arm-none-eabi'
	  'arm-none-eabi-gcc'
	  'arm-none-eabi-binutils'
	  'arm-none-eabi-newlib'
    )
url="https://launchpad.net/gcc-arm-embedded"
source=("https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q3-update/+download/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2")
license=('custom')
options=(!strip staticlibs)
sha256sums=('a397c49bdd0cf17a38a494cb691baf68b8dcffa4d4c06561ef3d71b2ab4c92a1')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/gcc-*
  cp -a * $pkgdir/usr
  rm -f $pkgdir/usr/bin/arm-none-eabi-gdb*
  rm -f $pkgdir/usr/lib/libcc1.so*
}
