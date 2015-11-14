# Maintainer: jjacky
pkgname=anopa
pkgver=0.3.0
pkgrel=1
pkgdesc="init system/service manager built around s6 supervision suite"
arch=('i686' 'x86_64')
url="http://jjacky.com/anopa"
license=('GPL3+')
depends=('execline' 's6')
makedepends=('skalibs')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('1f1891c063b5f4fc3a0c42d1e61411c2f6d6bfb64d3b84c4295acc78af85a72a')

build() {
  cd "$pkgname-$pkgver"
  ./configure --bindir=/usr/bin --libexecdir=/usr/lib/anopa
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
