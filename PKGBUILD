# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=safe-door
pkgver=0.9.6
pkgrel=2
pkgdesc="A safe cracking game for BBS DOORS"
arch=('i686' 'x86_64')
url="http://www.mbse.eu/bbsing/safedoor/"
license=('unknown')
depends=('doorlib')
source=(http://www.mbse.eu/download/bbsing/$pkgname-$pkgver.tar.bz2)
sha256sums=('7b3c91627fb2872c6d05ee562d4e4bdfe364f364b9bf9cc55071a80fb8605531')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
