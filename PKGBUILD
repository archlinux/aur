pkgname=ate
pkgver=1.0.1
pkgrel=1
pkgdesc="awesome terminal emulator"
url="https://github.com/andir/ate"
arch=(x86_64)
license=(AGPL)
depends=(rofi xurls)
makedepends=(vte3)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andir/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9915e44aa7ff9a48df2a16c3377b31cbc8349227b115ab3edb5bc95ba3c5db4e')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  install -m 755 ./ate $pkgdir/usr/bin/
}
