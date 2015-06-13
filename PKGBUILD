# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pure-sql3
pkgver=0.5
pkgrel=1
pkgdesc="A Pure interface to the sqlite3 database"
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'sqlite3')
makedepends=()
groups=(pure-complete pure-web)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=(d46205a34d9dde87c08a4afb981cfe4d35633971)

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
