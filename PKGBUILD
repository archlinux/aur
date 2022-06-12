# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: farid abdelnour < farid at atelier-labs.org>

pkgname=oggfwd-bzr
pkgdesc="Pipes an ogg stream to an icecast server"
license=('GPL')
url="http://v2v.cc/~j/oggfwd/"
pkgver=r13
pkgrel=1

conflicts=('oggfwd')
provides=('oggfwd')

source=("$pkgname::bzr+http://v2v.cc/~j/oggfwd")
md5sums=('SKIP')
depends=('libshout')
makedepends=('bzr')
arch=('i686' 'x86_64')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s" "$(bzr revno)"
}

build() {
	cd "$srcdir/$pkgname"
	make oggfwd
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 oggfwd "$pkgdir/usr/bin/oggfwd"
	install -D -m644 oggfwd.1 "$pkgdir/usr/share/man/man1/oggfwd.1"
}
