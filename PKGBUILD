# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxcpp
pkgver=5.0
pkgrel=1
pkgdesc="A library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxcpp"
license=('GPL')
makedepends=('cmake')
source=(${url}/archive/v${pkgver}.tar.gz)
md5sums=('e6be807dfbbcce6e0be7bd6027d32a28')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../"$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
