# Maintainer:  <aaron.l.france@gmail.com>
pkgname=buildapp
pkgver=1.5.5
pkgrel=2
epoch=
pkgdesc="A nice easy way to build Common Lisp images"
arch=('i686' 'x86_64')
url=""
license=('BSD')
depends=('sbcl')
makedepends=('sbcl')
provides=('buildapp')
source=(https://github.com/xach/$pkgname/archive/release-$pkgver.tar.gz)
md5sums=('a60d1f7c349075f358a1bf0bf9d1ba9c')

build() {
  cd "$srcdir/$pkgname-release-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
