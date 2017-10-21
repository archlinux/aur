# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.3.0
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/crystal-community/icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("https://github.com/crystal-community/icr/archive/v$pkgver.tar.gz")
sha256sums=('4e3695965c95d55d345baf8c7fc9a7eff0bf95da1b1c8141bdb63c2d5269a30e')

build() {
  cd "icr-$pkgver"
  make
}

check() {
  cd "icr-$pkgver"
  make test
}

package() {
  cd "icr-$pkgver"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
