# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-widget-styles
pkgver=0.5.1
pkgrel=1
pkgdesc="Hawaii widget styles"
arch=('i686' 'x86_64')
url="http://hawaiios.org"
license=('LGPL')
depends=('qt5-quickcontrols')
makedepends=('cmake')
source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('72f7d5e4d8a51b730bc1fbc018de2b96a624a097')

prepare() {
	cd ${pkgname}-${pkgver}
	mkdir -p build
}

build() {
	cd ${pkgname}-${pkgver}/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd ${pkgname}-${pkgver}/build
	make DESTDIR="${pkgdir}" install
}
