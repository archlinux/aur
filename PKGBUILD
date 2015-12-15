# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxcpp
pkgver=3.4
pkgrel=1
pkgdesc="A library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxcpp"
license=('GPL','LGPL')
makedepends=('cmake')
source=(${url}/archive/v${pkgver}.tar.gz)
md5sums=('bfd94ae47211c460abf2d893471531f0')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

check() {
  cd ${srcdir}/${pkgname}/build
  make test
}

package() {
  cd "$pkgname-$pkgver"/build
  make DESTDIR="$pkgdir/" install
}
