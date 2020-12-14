# Maintainer: Popolon <popolon@popolon.org>

pkgname=bootterm
pkgver=0.1
pkgrel=1
pkgdesc="Simple, reliable and powerful terminal designed to ease connection to ephemeral serial ports"
arch=('x86_64' 'armv7h' 'armv8')
url="https://github.com/wtarreau/bootterm/"
license=('MIT')
source=(https://github.com/wtarreau/$pkgname/archive/v${pkgver}.tar.gz)
sha256sums=('3c35ffef75dfc3e59552fd999114005b8fdf40fd85619ec9d93458c048987a82')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
