# Contributor: Immae <ismael.bouya@normalesup.org>

# Maintainer: Immae <ismael.bouya@normalesup.org>
pkgname=tack
pkgver=1.07_20130713
pkgrel=1
pkgdesc="A program that can be used to verify or refine a terminfo (terminal information) description of a terminal."
arch=('i686' 'x86_64')
url="http://invisible-island.net/ncurses/tack.html"
license=('custom')
changelog="$pkgname.changelog"
provides=('tack')
depends=('ncurses')
source=("ftp://invisible-island.net/ncurses/current/${pkgname}-${pkgver//_/-}.tgz")



build() {
	cd ${srcdir}/${pkgname}-${pkgver//_/-}
	./configure --prefix=/usr \
	   --bindir=/usr/bin
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver//_/-}
	make DESTDIR=${pkgdir} install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


md5sums=('c79fd171415dbdce11032e6bb42aa6f6')

