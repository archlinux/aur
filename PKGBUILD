# Maintainer: Beej <beej@beej.us>
# Contributor: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Brian "Beej" Hall <beej@beej.us>

pkgname=trader
pkgver=7.21
pkgrel=1
pkgdesc="Star Trader, a text-based game of interstellar trading"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.zap.org.au/software/trader"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'ncurses')
source=("https://ftp.zap.org.au/pub/trader/unix/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('541d1180dde04173c071d5c59eaf72a6572f8dfc8065e184eaf7d14bccd0257d'
            'SKIP')

# PGP Key available at https://www.zap.org.au/~john/contact.html
# John Zaitseff <J.Zaitseff@zap.org.au>
validpgpkeys=('B0F6BC7F46D30F1432FC46190D254111C4EE569B')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
