# Original Maintainer: James Duley <jagduley gmail>
# Previous Maintainer: 2bluesc <2bluesc gmail.com>
# Maintainer: Vadzim Dambrouski <pftbest gmail.com>
pkgname=gcc-arm-none-eabi-bin
pkgver=14.3.rel1
pkgrel=1
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes newlib, does NOT include GDB)"
arch=('aarch64' 'x86_64')
depends=('glibc')
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
url='https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads'
source_x86_64=('https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/14.3.rel1/binrel/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi.tar.xz')
source_aarch64=('https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/14.3.rel1/binrel/arm-gnu-toolchain-14.3.rel1-aarch64-arm-none-eabi.tar.xz')
license=('custom')
options=(!strip staticlibs)
sha256sums_x86_64=('8f6903f8ceb084d9227b9ef991490413014d991874a1e34074443c2a72b14dbd')
sha256sums_aarch64=('2d465847eb1d05f876270494f51034de9ace9abe87a4222d079f3360240184d3')
package() {
  cd $srcdir/arm-*/

  mkdir -p $pkgdir/usr
  mkdir -p $pkgdir/usr/lib/gcc
  mkdir -p $pkgdir/usr/libexec/gcc
  mkdir -p $pkgdir/usr/share/doc/gcc-arm-none-eabi
  mkdir -p $pkgdir/usr/share/man

  cp -a arm-none-eabi $pkgdir/usr
  cp -a bin $pkgdir/usr
  cp -a lib/gcc/arm-none-eabi $pkgdir/usr/lib/gcc
  cp -a libexec/gcc/arm-none-eabi $pkgdir/usr/libexec/gcc
  cp -a share/* $pkgdir/usr/share/doc/gcc-arm-none-eabi
  cp -a share/man/man1 $pkgdir/usr/share/man

  rm -f $pkgdir/usr/bin/arm-none-eabi-gdb*
  rm -f $pkgdir/usr/share/man/man1/arm-none-eabi-gdb*
}

