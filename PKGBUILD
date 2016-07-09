pkgname=gammaray
pkgver=2.5.0
pkgrel=1
epoch=
pkgdesc="A tool for examining the internals of a Qt application and to some extent also manipulate it"
arch=('i686' 'x86_64')
url="http://www.kdab.com/kdab-products/gammaray/"
license=('GPL')
depends=(graphviz qt5-script qt5-svg qt5-tools)
source=(https://github.com/KDAB/GammaRay/archive/v$pkgver.tar.gz)
md5sums=('1459fc825a106968c1cda482453a0b08')
build() {
	cd "$srcdir/GammaRay-$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/GammaRay-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
