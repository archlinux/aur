# Maintainer: Noam Lewis
pkgname=git-mediate
pkgver=1.1.0
pkgrel=1
pkgdesc="Tool to help resolving git conflicts"
arch=('any')
url="https://github.com/Peaker/git-mediate"
license=('GPL2')
depends=()
makedepends=('stack')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Peaker/git-mediate/archive/refs/tags/1.1.0.tar.gz")
sha256sums=('f8bacc2d041d1bef9288bebdb20ab2ee6fbd7d37d4e23c84f8dda27ff5b8ba59')

build() {
  cd "$srcdir/$pkgname-1.1.0"
  stack setup
  stack build
}

package() {
  cd "$srcdir/$pkgname-1.1.0"
  stack install --local-bin-path "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
