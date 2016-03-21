# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.2.5
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=('i686' 'x86_64')
url='https://github.com/greyblake/crystal-icr'
license=('LGPL')
depends=('crystal' 'readline')
source=("https://github.com/greyblake/crystal-icr/archive/v$pkgver.tar.gz")
sha256sums=('a35b7fe72a164bfe424d406e83d91e9ee6ac08793be1e4933a4a5f6ce6a2c806')

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
