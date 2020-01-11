# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Brian "Beej" Hall <beej@beej.us>

pkgname=trader
pkgver=7.14
pkgrel=1
pkgdesc="Star Trader, a simple text-based game of interstellar trading"
arch=('i686' 'x86_64')
url="http://www.zap.org.au/software/trader/"
license=('GPL3')
depends=('ncurses')
source=("https://ftp.zap.org.au/pub/trader/unix/$pkgname-$pkgver.tar.xz"{,.sig})
md5sums=('510c4273f91cd6edc4ac919cc0a4f401'
         'SKIP')
validpgpkeys=('B0F6BC7F46D30F1432FC46190D254111C4EE569B') # John Zaitseff <J.Zaitseff@zap.org.au>


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
