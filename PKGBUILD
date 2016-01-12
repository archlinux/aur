# Maintainer: jjacky
pkgname=slicd
pkgver=0.1.0
pkgrel=1
pkgdesc="simple lightweight Linux cron daemon"
arch=('i686' 'x86_64')
url="http://jjacky.com/slicd"
license=('GPL3+')
makedepends=('skalibs')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('cf57256b9f7216a0143d761982f026c84a13e5908649c9219360ea6ce0f190ad')

build() {
  cd "$pkgname-$pkgver"
  ./configure --bindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
