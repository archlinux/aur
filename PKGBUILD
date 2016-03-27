# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-icon-theme
pkgver=0.6.90.20160327
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
#source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("https://codeload.github.com/hawaii-desktop/${pkgname}/legacy.tar.gz/dfa9938a4ccc47c7b8ce7974afe1f6836b1e58cf")
sha1sums=('d31ca86b6d47ecf993f201cd82b3735092e62ff7')

prepare() {
	mkdir build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../hawaii-desktop-hawaii-icon-theme-dfa9938 \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
