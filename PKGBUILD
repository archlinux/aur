# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: farid abdelnour < farid at atelier-labs.org>

pkgname=oggfwd
pkgdesc="Pipes an ogg stream to an icecast server"
license=('GPL')
url="http://v2v.cc/~j/oggfwd/"
pkgver=0.2
pkgrel=3

source=("oggfwd::git+https://r-w-x.org/oggfwd.git#commit=abf64e0b4a492e578459ec338b239d99b63d6eb1")
md5sums=('SKIP')
depends=('libshout')
arch=('i686' 'x86_64')

build() {
	cd "$srcdir/$pkgname"
	make oggfwd
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 oggfwd "$pkgdir/usr/bin/oggfwd"
}
