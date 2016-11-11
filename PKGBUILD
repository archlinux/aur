# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.2.11
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=(i686 x86_64)
url='https://github.com/greyblake/crystal-icr'
license=(LGPL)
depends=('crystal' 'readline')
makedepends=('llvm')
source=("https://github.com/greyblake/crystal-icr/archive/v$pkgver.tar.gz")
sha256sums=('776dc9ef309e8857323b0a0f257d7c780e9c73762a5a32488371fb3da7b54ddd')

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
