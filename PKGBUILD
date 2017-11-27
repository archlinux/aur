# Maintainer: Adrian Room <ingolemo@gmail.com>

pkgname=knightsgame
pkgver=025
pkgrel=1
pkgdesc="A free multiplayer competitive game involving knights, dungeons, and quests."
arch=('x86_64')
url="http://www.knightsgame.org.uk/"
license=('GPL3')
depends=('boost-libs' 'sdl' 'curl' 'fontconfig')
makedepends=('boost')
source=(http://www.knightsgame.org.uk/files/knights_${pkgver}_src.tar.gz)
md5sums=('99d55713c2a0ca605252d87641817da4')

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
