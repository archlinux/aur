# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.2.14
pkgrel=2
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('5ce3ec01fd174faa9c3bcc171a5a8623b78b49772d1c94b630dc768549088aa5')

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
