# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=qterminal
pkgver=0.6.0
pkgrel=3
pkgdesc="Lightweight Qt-based terminal emulator"
arch=("i686" "x86_64")
url="https://github.com/lxde/qterminal"
license=("GPL2")
depends=("qt5-base" "qtermwidget")
makedepends=("cmake" "qt5-tools")
source=("https://github.com/lxde/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=("SKIP")


build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DUSE_SYSTEM_QXT=OFF \
		-DUSE_QT5=true
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
