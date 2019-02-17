# Maintainer: Manan Singh <mananapr@gmail.com>

pkgname=pxlart
pkgver=1.0
pkgrel=1
pkgdesc="A ncurses pixer art creator written in C"
arch=('any')
url="https://github.com/mananapr/pxlart/"
license=('MIT')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/pxlart/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build(){
  cd "pxlart-${pkgver}"
  make
}

package() {
  cd "pxlart-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 pxlart "$pkgdir/usr/local/bin/pxlart"
}
