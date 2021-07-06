# Maintainer: Victor Tran <vicr12345 at gmail dot com>

pkgname=tttermwidget
pkgver=1.0.1
pkgrel=0
pkgdesc="Terminal widget used by theTerminal"
arch=("i686" "x86_64")
url="https://github.com/vicr123/tttermwidget"
license=("GPL2")
depends=("qt5-base" "libsm" "libxkbcommon-x11" "libutf8proc" "the-libs")
makedepends=("qt5-tools")
source=("$pkgname-$pkgver"::'https://github.com/vicr123/tttermwidget/archive/v1.0.1.tar.gz')
sha256sums=("6329163b696c06b62df96aa04cb28bc7c85cfc862f34ef8a3d5a9eb504d5fe91")

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
