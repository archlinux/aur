# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=latte-integrale
pkgver=1.7.3
pkgrel=1
pkgdesc="Computer software dedicated to the problems of counting lattice points and integration inside convex polytopes"
arch=(i686 x86_64)
url="https://www.math.ucdavis.edu/~latte/"
license=(GPL)
depends=(4ti2 ntl cddlib lidia)
source=("https://www.math.ucdavis.edu/~latte/software/packages/latte_current/latte-int-$pkgver.tar.gz")
md5sums=('2ec40606c6755ba1770c8ac31155ecd9')

build() {
  cd latte-int-$pkgver

  export CXXFLAGS="-DNTL_STD_CXX $CXXFLAGS"
  ./configure --prefix=/usr --enable-shared --with-ntl=/usr
  make
}

package() {
  cd latte-int-$pkgver
  make install DESTDIR="$pkgdir"
}

