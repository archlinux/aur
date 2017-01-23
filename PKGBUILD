# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=blind
pkgver=1.0
pkgrel=1
pkgdesc="Suckless command line video editor"
arch=(x86_64 i686)
url="http://tools.suckless.org/blind/"
license=('custom:ISC')
depends=(ffmpeg)
optdepends=('imagemagick: support for other images formats than farbfeld and PAM')
source=(http://dl.suckless.org/tools/blind-${pkgver}.tar.gz)
sha1sums=(ae944dfa9d9824e93e4a6bf2d865e50fb4bc7f31)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
