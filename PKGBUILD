# Maintainer: jjacky
pkgname=slicd
pkgver=0.2.0
pkgrel=1
pkgdesc="simple lightweight Linux cron daemon"
arch=('i686' 'x86_64')
url="https://jjacky.com/slicd"
license=('GPL3+')
makedepends=('skalibs>=2.4.0.0')
source=(https://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('da0d5fb624f3c7e293f49fd83a19a1085c955dbe5c13303da8d3cfe52263ec73')

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
