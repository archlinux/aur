# Maintainer: Victor Tran <vicr12345 at gmail dot com>

pkgname=tttermwidget
pkgver=1.0
pkgrel=1
pkgdesc="Terminal widget used by theTerminal"
arch=("i686" "x86_64")
url="https://github.com/vicr123/tttermwidget"
license=("GPL2")
depends=("qt5-base" "libsm" "libxkbcommon-x11" "libutf8proc" "the-libs")
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/tttermwidget')
md5sums=("SKIP")

build() {
	mkdir -p build
	cd build
	qmake $srcdir/$pkgname-$pkgver/tttermwidget.pro
	make
}

package() {
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
