pkgname=phd2
pkgver=2.6.10
pkgrel=1
pkgdesc="Open PHD Guiding - PHD2 astrophotography autoguiding tool"
url="http://openphdguiding.org/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxgtk2' 'v4l-utils' 'zlib' 'cfitsio' 'opencv' 'libnova' 'libindi')
makedepends=('git' 'cmake')
source=("https://github.com/OpenPHDGuiding/phd2/archive/v${pkgver}.zip")
sha256sums=('fb57cf3134b6c9f94120e39b5b0e388d2a6baed95f8433940b90b95dd65c4e37')

prepare() {
	mkdir build
	cd build
	cmake ../phd2-$pkgver
}

build() {
	cd build
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}

