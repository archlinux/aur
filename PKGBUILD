# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-wallpapers
pkgver=0.8.0
pkgrel=1
pkgdesc="Wallpapers for the Hawaii desktop environment"
arch=('any')
url="https://github.com/hawaii-desktop"
license=('GPL')
makedepends=('extra-cmake-modules')
conflicts=('hawaii-wallpapers-git')
groups=('hawaii')
source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('5736df84a0df9dfed45234048ef65b663da4222e')

prepare() {
	mkdir build
}

build() {
	cd build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
