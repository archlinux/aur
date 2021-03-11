# Maintainer: Michael Duell < dev at akurei dot me >
gccver=92
pkgname=arm-none-eabi-bin-$gccver-complete
pkgver=9_2019_q4_major
pkgrel=2
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes newlib, includes GDB)"
arch=('x86_64' 'i686')
depends=('glibc')
optdepend=('python2')
provides=("gcc-arm-none-eabi" "gcc-arm-none-eabi-$gccver"
	  "arm-none-eabi-gcc" "arm-none-eabi-gcc-$gccver"
	  "arm-none-eabi-binutils" "arm-none-eabi-binutils-$gccver"
	  "arm-none-eabi-newlib" "arm-none-eabi-newlib-$gccver"
	  "arm-none-eabi-gdb" "arm-none-eabi-gdb-$gccver"
    )
url="https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
source=("https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-${pkgver//_/-}-x86_64-linux.tar.bz2"
        "LICENSE.zst")
license=('custom')
options=(!strip staticlibs)
b2sums=('9977e751aa457812c6401bdcdc963342a92595af0b7fbf4fb13e429c2f475752ee5b1d53d0774a31452131d3c6b3cfec188cff2933e6a12da27c206c5b78a561'
        '202032f22a1f35a80874e93eba0a52dce294b780f9efdbecf2b993e1df6e65dbcdf4cb3ffc459feae06e559f7bc9e6934ff698b4035a6a5e3a7588a3e1809c42')
md5sums=('fe0029de4f4ec43cf7008944e34ff8cc'
        '20737bbb5e041db4f2c139ad9108fa9f')

package() {
  install -d $pkgdir/usr
  cd $srcdir
  install -D LICENSE.zst $pkgdir/usr/share/licenses/$pkgname
  cd $srcdir/gcc-arm-none-eabi-${pkgver//_/-}
  rm lib/libcc1*
  cp -a * $pkgdir/usr/
}
