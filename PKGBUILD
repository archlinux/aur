pkgname=ate
pkgver=1.0.0
pkgrel=2
pkgdesc="awesome terminal emulator"
url="https://github.com/andir/ate"
arch=(x86_64)
license=(AGPL)
depends=(rofi xurls)
makedepends=(vte3)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andir/{$pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f9e0b1572d629736240b8c376e36972902f5189e3e2efadb69fd7192bbc0a7ec')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  install -m 755 ./ate $pkgdir/usr/bin/
}
