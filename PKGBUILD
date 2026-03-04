# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=git-protection
pkgver=1.0
pkgrel=1
pkgdesc='Spawn a new program with .git mounted as read-only'
url='https://codeberg.org/maandree/git-protection'
arch=(any)
license=('custom:ISC')
depends=(git libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(852a3fced9517f6509e973b14a0e06ba465f73259bdd81fb86ddf957cb5583b5)

build () {
	cd "$srcdir/git-protection"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/git-protection"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" post-install
}
