# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: Igor Hlina <srigi (at) srigi (dot) sk>
pkgname=cdu
pkgver=0.38
pkgrel=1
pkgdesc="du like command but display a pretty histogram with optional colors"
arch=('any')
url="http://arsunik.free.fr/prog/cdu.html"
license=('GPL')
depends=('perl')
source=(http://arsunik.free.fr/pkg/$pkgname-$pkgver.tar.gz)
md5sums=('68a6986cc4c049a990d217ae5bcde55a')
install=${pkgname}.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 cdu $pkgdir/usr/bin/cdu
  install -D -m644 cdu.1 $pkgdir/usr/share/man/man1/cdu.1
}

# vim:set ts=2 sw=2 et:
