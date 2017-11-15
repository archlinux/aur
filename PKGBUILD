# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.4.0
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('6d3ba783b68a425c3def6918bbfb48c828d0d56e8636b7afbebd12a40a7dc5d3')

build() {
  cd "icr-$pkgver"
  make
}

# check() {
#   cd "icr-$pkgver"
#   make test
# }

package() {
  cd "icr-$pkgver"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
