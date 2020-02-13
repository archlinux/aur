# Maintainer: Victor Tran <vicr12345 at gmail dot com>

pkgname=tttermwidget
pkgver=1.0
pkgrel=2
pkgdesc="Terminal widget used by theTerminal"
arch=("i686" "x86_64")
url="https://github.com/vicr123/tttermwidget"
license=("GPL2")
depends=("qt5-base" "libsm" "libxkbcommon-x11" "libutf8proc" "the-libs")
makedepends=("qt5-tools")
source=("$pkgname-$pkgver"::'https://github.com/vicr123/tttermwidget/archive/v1.0.tar.gz')
sha256sums=("c7360d2bf1a00a90174b4b69e2f53e83e6f7d5afee5d520d3c9fe3a25055ac26")

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
