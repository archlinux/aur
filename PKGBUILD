# Maintainer: Manan Singh <mananapr@gmail.com>

pkgname=pxlart
pkgver=1.0
pkgrel=2
pkgdesc="A ncurses pixer art creator written in C"
arch=('any')
url="https://github.com/mananapr/pxlart/"
license=('MIT')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/pxlart/archive/v${pkgver}.tar.gz")
sha256sums=('e9ae056758f929184384e1ba0c6223c23e4037468bc6b58d37b15f77cd97b074')

build(){
  cd "pxlart-${pkgver}"
  make
}

package() {
  cd "pxlart-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 pxlart "$pkgdir/usr/local/bin/pxlart"
}
