pkgname=phd2
pkgver=2.6.13
pkgrel=1
pkgdesc="Open PHD Guiding - PHD2 astrophotography autoguiding tool"
url="http://openphdguiding.org/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxwidgets-gtk3' 'v4l-utils' 'zlib' 'cfitsio' 'opencv' 'libnova' 'libindi')
makedepends=('git' 'cmake')
source=("https://github.com/OpenPHDGuiding/phd2/archive/v${pkgver}.zip")
sha256sums=('bee327efdd5f4be4df7df974aa04d4d3afb5a96a4173ce73c072043a76a31171')

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

