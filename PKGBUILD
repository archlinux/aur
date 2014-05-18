# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: farid abdelnour < farid at atelier-labs.org>

bzrname=oggfwd
pkgname=oggfwd-bzr
pkgver=r13
pkgrel=1
pkgdesc="Pipes an ogg stream to an icecast server"
arch=('i686' 'x86_64')
url="http://v2v.cc/~j/oggfwd/"
license=('GPL')
depends=(libshout)
makedepends=(bzr)
conflicts=(oggfwd)
provides=(oggfwd)
source=(bzr+http://v2v.cc/~j/oggfwd)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$bzrname"
  printf "r%s" "$(bzr revno)"
}

build () {
  cd "$srcdir/$bzrname"
  make oggfwd
}

package() {
  cd "$srcdir/$bzrname"
  install -D -m755 oggfwd   "$pkgdir/usr/bin/oggfwd"
  install -D -m644 oggfwd.1 "$pkgdir/usr/share/man/man1/oggfwd.1"
}

