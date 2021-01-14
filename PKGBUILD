pkgname=phd2
pkgver=2.6.9
pkgrel=1
pkgdesc="Open PHD Guiding - PHD2 astrophotography autoguiding tool"
url="http://openphdguiding.org/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxgtk2' 'v4l-utils' 'zlib' 'cfitsio' 'opencv' 'libnova' 'libindi')
makedepends=('git' 'cmake')
source=("https://github.com/OpenPHDGuiding/phd2/archive/v${pkgver}.zip")
sha256sums=('381cc2621c2ab697bcdeed90a85a0a7b487c2b5a08871c047e245568261eda71')

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

