# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=googlemaps
pkgver=20210323
_commit=8f7def10c203fd3faa5ef96c5010a7294dca0759
pkgrel=1
pkgdesc='Google Maps plugin for QtLocation'
url='https://github.com/vladest/googlemaps'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'qt5-tools')
depends=('qt5-location')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')
source=("git+https://github.com/vladest/googlemaps#commit=${_commit}?signed")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	install -d build
	cd build
	qmake ../googlemaps.pro
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}
