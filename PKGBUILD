# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.2.14
pkgrel=3
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('0f8cb18d04cc1e0247586d66fad904d56c29658edfb04b0091c464864f2cdbdf')

build() {
  cd "$pkgname-$pkgver"
  make
}

# check() {
#   cd "$pkgname-$pkgver"
#   make test
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
