# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-terminal
pkgver=0.2.0
pkgrel=1
pkgdesc="The Hawaii Terminal Emulator"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('GPL2')
depends=('qt5-declarative' 'qt5-quickcontrols')
makedepends=('cmake' 'qtchooser')
source=("http://sourceforge.net/projects/mauios/files/hawaii/${pkgname}/${pkgname}-${pkgver}.tar.gz/download")
md5sums=('73f7996d891ea7b8b1c8e48eb3327209')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
