# Maintainer: Manan Singh <mananapr@gmail.com>

pkgname=pxlart
pkgver=1.4
pkgrel=1
pkgdesc="A ncurses pixer art creator written in C"
arch=('any')
url="https://github.com/mananapr/pxlart/"
license=('MIT')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/pxlart/archive/v${pkgver}.tar.gz")
sha256sums=('7d92ceb96adec8298396ca9f9843800b1c408d5601a968033264619ce0902386')

build(){
  cd "pxlart-${pkgver}"
  make
}

package() {
  cd "pxlart-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 pxlart.1 "$pkgdir/usr/local/man/man1/pxlart.1"
  install -Dm755 pxlart "$pkgdir/usr/local/bin/pxlart"
  install -Dm755 mkppm "$pkgdir/usr/local/bin/mkppm"
}
