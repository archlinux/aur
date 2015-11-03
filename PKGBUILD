# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=qtermwidget-q4
_pkgname=qtermwidget
pkgver=0.6.0
pkgrel=2
pkgdesc="A terminal widget for Qt"
arch=("i686" "x86_64")
url="https://github.com/qterminal/qtermwidget"
license=("GPL2")
depends=("qt4")
makedepends=("cmake")
source=("https://github.com/qterminal/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz")
sha256sums=('1ea148e67c3e28a53ca24a3c91532507ddd6c5d28611467e7a67334d945cd010')

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
                -DLIB_SUFFIX="" \
                -DCMAKE_INSTALL_LIBDIR=lib

	make

}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
