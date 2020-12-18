# Maintainer: Popolon <popolon@popolon.org>

pkgname=bootterm
pkgver=0.2
pkgrel=1
pkgdesc="Simple, reliable and powerful terminal designed to ease connection to ephemeral serial ports"
arch=('x86_64' 'armv7h' 'armv8')
url="https://github.com/wtarreau/bootterm/"
license=('MIT')
source=(https://github.com/wtarreau/$pkgname/archive/v${pkgver}.tar.gz)
sha256sums=('5beef823c9655f09555bfe4a9ea64e81f51f10582f64655a0fe939a1542e53d3')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
