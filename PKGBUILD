# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=corevantage-x230
_pkgname=corevantage
pkgver=1.5
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Graphical user interface to configure coreboot settings for: ThinkPad X230"
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('42c448d1732981818142b87f248f2410c60320804f3c9591cc43effa5ab92f9c')
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
	make -C build x230
}

package() {
	cd ${_pkgname}-${pkgver}
	make -C build DESTDIR="$pkgdir/" install
}
