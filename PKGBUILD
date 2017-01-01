# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_modulename=wallpapers

pkgname=liri-${_modulename}
pkgver=0.9.0
pkgrel=1
pkgdesc="Wallpapers for Liri OS"
arch=('any')
url='https://liri.io'
license=('GPL3')
makedepends=('extra-cmake-modules')
conflicts=('liri-wallpapers-git')
groups=('liri')
source=("https://github.com/lirios/${_modulename}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('98112d8febfe1aaf115285a061d4450c13bd7a1197b9539ac04437637745604c')

prepare() {
	mkdir -p build
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
