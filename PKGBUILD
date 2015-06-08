# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-widget-styles
pkgver=0.2.0
pkgrel=1
pkgdesc="Hawaii widget styles"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('LGPL')
depends=('qt5-quickcontrols')
makedepends=('cmake' 'qtchooser')
source=("http://sourceforge.net/projects/mauios/files/hawaii/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('fbbfe25fd6f22829ede9cbc79a2ea781')

prepare() {
	cd ${pkgname}-${pkgver}
	mkdir -p build
}

build() {
	export QT_SELECT=5

	cd ${pkgname}-${pkgver}/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd ${pkgname}-${pkgver}/build
	make DESTDIR="${pkgdir}" install
}
