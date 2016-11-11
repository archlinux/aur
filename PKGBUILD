# Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=eigen2
pkgver=2.0.17
pkgrel=3
pkgdesc="C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms"
arch=('any')
url='http://eigen.tuxfamily.org'
license=('GPL' 'LGPL3')
makedepends=('cmake' 'pkg-config')
source=("http://bitbucket.org/eigen/eigen/get/${pkgver}.tar.bz2")
sha256sums=('7255e856ed367ce6e6e2d4153b0e4e753c8b8d36918bf440dd34ad56aff09960')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../eigen-eigen-b23437e61a07 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
