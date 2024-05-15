# Maintainer: Adrian Room <ingolemo@gmail.com>

pkgname=knightsgame
pkgver=026
pkgrel=1
pkgdesc="A free multiplayer competitive game involving knights, dungeons, and quests."
arch=('x86_64')
url="http://www.knightsgame.org.uk/"
license=('GPL2')
depends=('boost-libs' 'sdl2' 'curl' 'fontconfig')
makedepends=('boost')
source=(http://www.knightsgame.org.uk/files/knights_${pkgver}_src.tar.gz)
sha256sums=('6e49d071385008bc431b8e08a9d2721ce1cabdcb356ef76c881256a0780721b2')

build() {
	cd "$srcdir/knights_${pkgver}_src"

	prefix=/usr
	make \
		PREFIX="$prefix" \
		DOC_DIR="$prefix/share/doc/$pkgname" \
		DATA_DIR="$prefix/share/$pkgname"
}

package() {
	cd "$srcdir/knights_${pkgver}_src"
	prefix="$pkgdir/usr"
	make install \
		PREFIX="$prefix" \
		DOC_DIR="$prefix/share/doc/$pkgname" \
		DATA_DIR="$prefix/share/$pkgname"
}
