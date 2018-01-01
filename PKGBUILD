# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.5.0
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('f2b5cb971b368085e9c4f607d906e0622aa94d65c0f7c820d9cbdf23fb972c33')

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
