# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Brian "Beej" Hall <beej@beej.us>

pkgname=trader
pkgver=7.18
pkgrel=1
pkgdesc="Star Trader, a text-based game of interstellar trading"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.zap.org.au/software/trader"
license=('GPL3')
depends=('hicolor-icon-theme' 'ncurses')
source=("https://ftp.zap.org.au/pub/trader/unix/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('3730b2fedd339adfc34c1640b309b3413b10b3d78969dcd71f07fd76b4514e85'
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
