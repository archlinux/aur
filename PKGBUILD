# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=googlemaps
pkgver=20220503
_commit=2f8b4ba0ba54ff593511522ab0b9df57ac485054
pkgrel=1
pkgdesc='Google Maps plugin for QtLocation'
url='https://github.com/vladest/googlemaps'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'qt5-tools')
depends=('qt5-location')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')
source=("git+https://github.com/vladest/googlemaps#commit=${_commit}")
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
