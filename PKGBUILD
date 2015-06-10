# Maintainer: Johannes Postma <jgmpostma@gmail.com>
pkgname=8play
pkgver=2
pkgrel=1
pkgdesc="An unofficial command-line player for 8tracks.com"
arch=('i686' 'x86_64')
url="https://github.com/jgmp/8play"
license=('BSD')
depends=('curl' 'json-c' 'ffmpeg' 'sdl')
source=(https://github.com/jgmp/archive/raw/master/$pkgname-$pkgver.tar.gz)
md5sums=('0c851a8fe47382d066cdb22b68cd64e2')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
