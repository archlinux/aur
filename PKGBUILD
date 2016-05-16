# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.2.8
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/greyblake/crystal-icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm35')
source=("https://github.com/greyblake/crystal-icr/archive/v$pkgver.tar.gz")
sha256sums=('5a235ee2f3065c6cf9479a7c32a11ba3d11f5e185d6c1458a97bd60eb11f88a3')

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
