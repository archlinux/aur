# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.2.12
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/greyblake/crystal-icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("https://github.com/greyblake/crystal-icr/archive/v$pkgver.tar.gz")
sha256sums=('f10a6c176c0ac4e4bee42bff2e6abfcef7640242362604c062d974bc5c6301d0')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
