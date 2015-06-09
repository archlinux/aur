# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxcpp
pkgver=3.2
pkgrel=1
pkgdesc="A library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxcpp"
license=('GPL','LGPL')
makedepends=('cmake')
source=(${url}/archive/v${pkgver}.tar.gz)
md5sums=('a482632b75164730debbd5b1799acc22')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"/build
  make DESTDIR="$pkgdir/" install
}
