# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: farid abdelnour < farid at atelier-labs.org>

pkgname=oggfwd
pkgdesc="Pipes an ogg stream to an icecast server"
license=('GPL')
url="http://v2v.cc/~j/oggfwd/"
pkgver=0.2
pkgrel=3

source=("http://www.v2v.cc/~j/ffmpeg2theora/${pkgname}/${pkgname}.tar.gz")
md5sums=('8402d26a5a8ff318ef6ea01ec146c8cc')
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
