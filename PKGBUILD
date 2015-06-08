# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-icon-themes
pkgver=0.4.0
pkgrel=1
pkgdesc="Hawaii icon themes"
arch=('any')
url="https://github.com/hawaii-desktop"
license=('GPL2' 'CC-BY-SA' 'LGPL2.1')
depends=('captiva-icons-git' 'faba-icon-theme-git' 'gnome-icon-theme' 'hicolor-icon-theme')
makedepends=('cmake')
conflicts=('hawaii-icon-themes-git')
groups=('hawaii')
source=("https://github.com/hawaii-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('4e368b3dbccac5741bc89c173e827464')

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
