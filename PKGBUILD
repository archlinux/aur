# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=git-protection
pkgver=1.0.1
pkgrel=1
pkgdesc='Spawn a new program with .git mounted as read-only'
url='https://codeberg.org/maandree/git-protection'
arch=(any)
license=('custom:ISC')
depends=(git libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(90bb71de56198f4365b25e593a604f946d02156862778148d2f72b2bdd9800f8)

build () {
	cd "$srcdir/git-protection"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/git-protection"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" post-install
}
