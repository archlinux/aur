# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# 
# for _mod use either (src_no_xspec_modeldata or src) and dont forget to change sha256sums

pkgname=heasoft
pkgver=6.27
pkgrel=1
_mod="src_no_xspec_modeldata" 
pkgdesc="NASA high energy astrophysics library"
makedepends=("gcc" "glibc" "gcc-fortran" "perl" "python")
depends=("ncurses" "readline" "libxpm" )
url="https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/"
arch=('x86_64')
license=('NASA' 'GPL')
source=(https://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/lheasoft${pkgver}/${pkgname}-${pkgver}${_mod}.tar.gz)
sha256sums=('a2359c2c765828eb9c1782769398e2a1f83cbcd3d46fb1be6b59a89b847cc5d4')
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
 
}

