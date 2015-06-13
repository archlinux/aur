# Maintainer: SanskritFritz (gmail)
# Contributor: bidulock (AUR)

pkgname=wmspaceclock
_prgname=spaceclock
pkgver=1.2d
pkgrel=4
pkgdesc="Dockapp showing antialiased analog clock."
url="http://$pkgname.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('gdk-pixbuf')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$_prgname-$pkgver.tar.bz2")

build() {
	cd "$srcdir/$_prgname"
	./configure
	make
}

package() {
	cd "$srcdir/$_prgname"
	mkdir -p "$pkgdir/usr/local/bin"
	rm --recursive pixmaps/CVS
	make DESTDIR="$pkgdir" install
}

md5sums=('97bcf9cc8a5518f8b37752beba9a7a9c')
