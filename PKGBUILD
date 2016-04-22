# Original Maintainer: James Duley <jagduley gmail>
# Previous Maintainer: 2bluesc <2bluesc gmail.com>
# Maintainer: Vadzim Dambrouski <pftbest gmail.com>
pkgname=gcc-arm-none-eabi-bin
pkgver=5_2016_q1_update
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
source=("https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q1-update/+download/gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2")
license=('custom')
options=(!strip staticlibs)
sha256sums=('217850b0f3297014e8e52010aa52da0a83a073ddec4dc49b1a747458c5d6a223')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/gcc-*
  cp -a * $pkgdir/usr
  rm -f $pkgdir/usr/bin/arm-none-eabi-gdb*
  rm -f $pkgdir/usr/lib/libcc1.so*
}
