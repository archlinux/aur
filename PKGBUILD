# Maintainer: Pierre Carrier <pierre@gcarrier.fr>
pkgname=sensible-utils
pkgver=0.0.7
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
arch=(any)
url="http://packages.debian.org/source/sid/sensible-utils"
license=('unknown')
makedepends=(po4a)
source=(http://ftp.de.debian.org/debian/pool/main/s/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('9a208cceb0e9c5cc1d2aa4d53d7d2baa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
