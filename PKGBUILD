# Maintainer: Rafael Silva <silvagracarafael gmail.com>
pkgname=arm-none-eabi-bin
pkgver=9_2019_q4_major
pkgrel=1
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes newlib, includes GDB)"
arch=('x86_64')
depends=('glibc' 'ncurses5-compat-libs')
provides=('gcc-arm-none-eabi'
	  'arm-none-eabi-gcc'
	  'arm-none-eabi-binutils'
	  'arm-none-eabi-newlib'
          'arm-none-eabi-gdb'
)
conflicts=('gcc-arm-none-eabi'
	  'arm-none-eabi-gcc'
	  'arm-none-eabi-binutils'
	  'arm-none-eabi-newlib'
          'arm-none-eabi-gdb'
)
url="https://developer.arm.com/open-source/gnu-toolchain/gnu-rm"
source=("https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2019q4/RC2.1/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2")
license=('custom')
options=(!strip staticlibs)
md5sums=('fe0029de4f4ec43cf7008944e34ff8cc')

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir/gcc-*/
  cp -a * $pkgdir/usr
  rm -f $pkgdir/usr/lib/libcc1.so*
}
