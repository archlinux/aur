# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-wallpapers
pkgver=0.4.0
pkgrel=1
pkgdesc="Wallpapers for the Hawaii desktop environment"
arch=('any')
url="https://github.com/hawaii-desktop"
license=('GPL')
makedepends=('extra-cmake-modules')
conflicts=('hawaii-wallpapers-git')
groups=('hawaii')
source=("https://github.com/hawaii-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('60935f18e84733c9c10a5c9216ab7a38')

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
