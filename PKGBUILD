# Original Maintainer: James Duley <jagduley gmail>
# Previous Maintainer: 2bluesc <2bluesc gmail.com>
# Previous Maintainer: Vadzim Dambrouski <pftbest gmail.com>
# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
gccver=63
pkgname=gcc-arm-none-eabi-bin-$gccver
pkgver=6_2017_q2_update
pkgrel=1
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes newlib, does NOT include GDB)"
arch=('x86_64')
depends=('glibc')
optdepends=(
	  'arm-none-eabi-gdb: GNU Debugger for ARM EABI'
    )
provides=("gcc-arm-none-eabi" "gcc-arm-none-eabi-$gccver"
	  "arm-none-eabi-gcc" "arm-none-eabi-gcc-$gccver"
	  "arm-none-eabi-binutils" "arm-none-eabi-binutils-$gccver"
	  "arm-none-eabi-newlib" "arm-none-eabi-newlib-$gccver"
    )
url="https://developer.arm.com/open-source/gnu-toolchain/gnu-rm"
source=("https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2")
license=('custom')
options=(!strip staticlibs)
sha256sums=('e68e4b2fe348ecb567c27985355dff75b65319a0f6595d44a18a8c5e05887cc3')

package() {
  mkdir -p $pkgdir/opt
  cd $srcdir/
  cp -a gcc-*/ $pkgdir/opt
  rm -f $pkgdir/opt/gcc-*/bin/arm-none-eabi-gdb*
}
