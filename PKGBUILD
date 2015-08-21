# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=lidia
pkgver=2.3.0
_patchver=2014-10-04
pkgrel=1
pkgdesc="A library for computational number theory"
arch=(i686 x86_64)
url="https://www.math.ucdavis.edu/~latte/"
license=(GPL)
depends=(gmp)
source=("https://www.math.ucdavis.edu/~latte/software/packages/lidia/current/lidia-$pkgver+latte-patches-$_patchver.tar.bz2")
md5sums=('6d0e4d4271af9df322087ae3325f5028')

build() {
  cd lidia-$pkgver+latte-patches-$_patchver

  export CXXFLAGS="-DNTL_STD_CXX $CXXFLAGS"
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd lidia-$pkgver+latte-patches-$_patchver
  make install DESTDIR="$pkgdir"
}

