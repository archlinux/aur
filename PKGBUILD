# Maintainer: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>

pkgname=tcllauncher
pkgver=1.6
pkgrel=1
pkgdesc="A launcher for Tcl applications."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/flightaware/tcllauncher'
license=('BSD')
source=("${pkgname}.tar.gz::https://github.com/flightaware/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('ab0f3bfd7151c95cfda2ca8c817ac54e05dd7559')
depends=('tcl')
changelog="$pkgname.changelog"

prepare() {
  cd $pkgname-$pkgver
  autoconf
  ./configure
}

build() {
  cd $pkgname-$pkgver 
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="${pkgdir}"
  install -Dm644 license.terms ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

