# Maintainer: Manan Singh <mananapr@gmail.com>

pkgname=pxlart
pkgver=1.1
pkgrel=1
pkgdesc="A ncurses pixer art creator written in C"
arch=('any')
url="https://github.com/mananapr/pxlart/"
license=('MIT')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/pxlart/archive/v${pkgver}.tar.gz")
sha256sums=('76072d0724dbb4351cb4be1e1d92d87c79d51696e10871da275faa09c7175a4f')

build(){
  cd "pxlart-${pkgver}"
  make
}

package() {
  cd "pxlart-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 pxlart "$pkgdir/usr/local/bin/pxlart"
}
