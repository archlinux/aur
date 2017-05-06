# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=blind
pkgver=1.1
pkgrel=1
pkgdesc="Suckless command line video editor"
arch=(x86_64 i686)
url="http://tools.suckless.org/blind/"
license=('custom:ISC')
depends=(ffmpeg)
optdepends=('imagemagick: support for other images formats than farbfeld and PAM')
source=(http://dl.suckless.org/tools/blind-${pkgver}.tar.gz)
sha1sums=(ce4f24d208dedf04c1fbdca2d027175b3585a7e2)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
