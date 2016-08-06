# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-icon-theme
pkgver=0.8.0
pkgrel=1
pkgdesc="Hawaii icon theme"
arch=('any')
url="http://hawaiios.org"
license=('GPL3')
depends=('hicolor-icon-theme')
makedepends=('cmake')
conflicts=('hawaii-icon-theme-git')
replaces=('hawaii-icon-themes')
groups=('hawaii')
source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('a56488ef864a35248e5e6a0f1313155217a0af53')

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
