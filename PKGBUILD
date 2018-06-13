# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=tttermwidget
pkgver=0.6.0
pkgrel=2
pkgdesc="A terminal widget for Qt"
arch=("i686" "x86_64")
url="https://github.com/vicr123/tttermwidget"
license=("GPL2")
depends=("qt5-base" "libsm" "libxkbcommon-x11")
makedepends=("cmake")
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/tttermwidget')
md5sums=("SKIP")

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_DESIGNER_PLUGIN=0 \
		-DUSE_QT5=true
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
