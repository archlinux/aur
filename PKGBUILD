# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=googlemaps
pkgver=20240121
_commit=fdad408ce0d99b48af80ee9510bc46b5676ca782
pkgrel=1
pkgdesc='Google Maps plugin for QtLocation'
url='https://github.com/vladest/googlemaps'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'qt6-tools')
depends=('qt6-location')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')
source=("git+https://github.com/vladest/googlemaps#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	install -d build
	cd build
	qmake6 ../googlemaps.pro
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}
