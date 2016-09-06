# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=olm
pkgname=libolm
pkgver=1.1.0
pkgrel=1
pkgdesc='An implementation of a well known cryptographic ratchet in C++'
arch=('i686' 'x86_64' 'armv7h')
url="https://matrix.org/git/olm/"
license=('Apache')
depends=('gcc-libs')
source=("https://matrix.org/git/$_pkgname/snapshot/$_pkgname-$pkgver.tar.bz2")
md5sums=('8779c22200b639ef08cb338b187459e9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

#check() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  make test
#}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sts=2 sw=2 et:
