# Maintainer: Flaviu Tamas <tamas.flaviu@gmail.com>
# Contributor: Guangyu Zhang <zguangyu123@gmail.com>
pkgname=testu01
_pkgname=TestU01
pkgver=1.2.3
pkgrel=3
pkgdesc="A library offering a collection of utilities for the empirical statistical testing of uniform random number generators"
arch=('i686' 'x86_64')
url="http://simul.iro.umontreal.ca/testu01/tu01.html"
license=('custom')
depends=('glibc')
source=(http://simul.iro.umontreal.ca/$pkgname/$_pkgname.zip)
sha256sums=('bc1d1dd2aea7ed3b3d28eaad2c8ee55913f11ce67aec8fe4f643c1c0d2ed1cac')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
