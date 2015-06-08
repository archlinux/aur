# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtconfiguration
pkgver=0.2.1
pkgrel=1
pkgdesc="Settings API with change notifications for Qt"
arch=('i686' 'x86_64')
url="https://github.com/mauios/qtconfiguration"
license=('GPL3' 'LGPL' 'custom')
depends=('qt5-base' 'dconf')
makedepends=('cmake')
source=("http://sourceforge.net/projects/mauios/files/hawaii/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b95d0d796b89cea2db45305c9eac04f0')

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
