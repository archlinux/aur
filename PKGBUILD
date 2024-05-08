# Maintainer: Colin Teng <tfcolin@88.com>
pkgname=slidegame
pkgver=1.2.0
pkgrel=1
pkgdesc="An classical puzzle game: Slide blocks to restore a picture."
arch=('x86_64')
url="https://gitee.com/tfcolin/slide"
license=('GPL-3.0-or-later')
depends=('gtk3' 'ncurses')
options=('strip' '!debug')
source=("https://github.com/tfcolin/slide/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd "slide-$pkgver"
	make
}

package() {
	cd "slide-$pkgver"
    export PREFIX="$pkgdir/usr/"
	make install
    make install_test
    install -Dm644 doc/slide.pdf -t "$pkgdir"/usr/share/doc/slidegame/
}
sha256sums=('091cf17f0d3cb523f4950e7d8c684a1e2160438083d1d64ff3a4d3e54e3fed17')
