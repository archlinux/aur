pkgname=phd2
pkgver=2.6.11
pkgrel=2
pkgdesc="Open PHD Guiding - PHD2 astrophotography autoguiding tool"
url="http://openphdguiding.org/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxwidgets-gtk3' 'v4l-utils' 'zlib' 'cfitsio' 'opencv' 'libnova' 'libindi')
makedepends=('git' 'cmake')
source=("https://github.com/OpenPHDGuiding/phd2/archive/v${pkgver}.zip")
sha256sums=('342973c2b86ae9dec6cf057c896e8a076b6cc9675f35730de227268bcac1ef34')

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

