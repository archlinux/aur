# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# 
# for _mod use either (src_no_xspec_modeldata or src) and dont forget to change sha256sums

pkgname=heasoft
pkgver=6.24
pkgrel=1
_mod="src_no_xspec_modeldata" 
pkgdesc="NASA high energy astrophysics library"
makedepends=("gcc" "glibc" "gcc-fortran" "perl")
depends=("ncurses" "readline" "libxpm" )
url="https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/"
arch=('x86_64')
license=('NASA' 'GPL')
source=(http://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/release/${pkgname}-${pkgver}${_mod}.tar.gz)
sha256sums=('64c6b0ee24a5912f9f600703f9576a2bf5242a4290dc7f4ce2d309d556e0280d') # src_no_xspec_modeldata
#sha256sums=('08037a9ca3f0803829398deafaaafd634dfdce597ae093b9757a10c74a8c617e') # src
install="${pkgname}.install"

build() {

  export CC=/usr/bin/gcc
  export CXX=/usr/bin/g++
  export FC=/usr/bin/gfortran
  export PERL=/usr/bin/perl

  cd $srcdir/${pkgname}-${pkgver}/BUILD_DIR
  ./configure --prefix=${pkgdir}/opt/${pkgname}
  
  make 

}

package(){

  cd $srcdir/${pkgname}-${pkgver}/BUILD_DIR
  make install


  #mkdir -p $pkgdir/opt/${pkgname}-${pkgver}/x86_64-unknown-linux-gnu-libc${_glibcver}/bin/

 
}

