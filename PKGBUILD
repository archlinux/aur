# Maintainer: Colin Teng <tfcolin@88.com>
pkgname=slidegame
pkgver=1.1.6
pkgrel=1
pkgdesc="An classical puzzle game: Slide blocks to restore a picture."
arch=('x86_64')
url="https://gitee.com/tfcolin/slide"
license=('GPL-3.0-or-later')
depends=('gtk3' 'ncurses')
source=("https://github.com/tfcolin/slide/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd "slide-$pkgver"
	make
}

package() {
	cd "slide-$pkgver"
	PREFIX="$pkgdir/usr/" make install_all
    install -Dm644 doc/slide.pdf -t "$pkgdir"/usr/share/doc/slidegame/
}
sha256sums=('3f4dd801418a17f886e7f1d0c60f3ed0b918561541bec3bcf8c7d69285db47b6')
