# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=corevantage-x201
_pkgname=corevantage
pkgver=1.4
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Graphical user interface to configure coreboot settings for: ThinkPad X201"
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('b8444ae61d98113568aded5f4d85dfa44c93e97a5356ce6acdc26721835da269')
provides=("corevantage")
conflicts=("corevantage")
makedepends=("qt5-quickcontrols"
	     "cmake")
depends=("nvramtool-corevantage-git"
	 "qt5-base"
	 "hicolor-icon-theme")

build() {
	cd ${_pkgname}-${pkgver}
	cmake -B build
	make -C build x201
}

package() {
	cd ${_pkgname}-${pkgver}
	make -C build DESTDIR="$pkgdir/" install
}
