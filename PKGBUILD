# Maintainer: Johannes Postma <jgmpostma@gmail.com>
pkgname=8p
pkgver=1.2
pkgrel=2
pkgdesc="An ncurses-based command-line player for 8tracks.com"
arch=('x86_64')
url="https://github.com/jgmp/8p"
license=('BSD')
depends=('curl' 'jansson' 'libbsd' 'ncurses' 'vlc')
source=(https://github.com/jgmp/archive/raw/master/$pkgname-$pkgver.tar.gz)
md5sums=('e1f7c9746c2f49c73bd9db001411487b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
