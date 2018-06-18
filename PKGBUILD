# Maintainer: Vadzim Dambrouski <pftbest gmail.com>
pkgname=msp430-elf-gcc-bin
pkgver=7.3.1.24
pkgrel=1
pkgdesc="GNU Tools for TI MSP430 microcontroller family (binary distribution, release 6_0_1_0)"
arch=('x86_64')
depends=('glibc' 'gcc')
optdepends=('msp430-elf-mcu')
provides=(
  'msp430-elf-gcc'
  'msp430-elf-gdb'
  'msp430-elf-binutils'
  'msp430-elf-newlib'
)
conflicts=(
  'msp430-elf-gcc'
  'msp430-elf-gdb'
  'msp430-elf-binutils'
  'msp430-elf-newlib'
)
url="http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/index_FDS.html"
source=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/6_0_1_0/exports/msp430-gcc-7.3.1.24_linux64.tar.bz2")
license=('GPL')
options=(!strip staticlibs)
sha256sums=('13a362cb459ae510d1b41c074d72298be45a5b7fd53ae189c38fcfdb19bcd8ac')

package() {
  mkdir -p $pkgdir/usr/share/man
  mkdir -p $pkgdir/usr/share/msp430-gcc
  cd $srcdir/msp430-gcc-$pkgver*/
  cp -a bin        $pkgdir/usr/
  cp -a lib        $pkgdir/usr/
  cp -a libexec    $pkgdir/usr/
  cp -a msp430-elf $pkgdir/usr/
  cp -a share/man/man1 $pkgdir/usr/share/man/
  cp -a share/man/man5 $pkgdir/usr/share/man/
  cp -a *.* $pkgdir/usr/share/msp430-gcc/
}
