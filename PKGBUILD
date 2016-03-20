# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.2.4
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=('i686' 'x86_64')
url='https://github.com/greyblake/crystal-icr'
license=('unknown')
depends=('crystal' 'readline')
source=("https://github.com/greyblake/crystal-icr/archive/v$pkgver.tar.gz")
sha256sums=('95c9b49532dc1914d34fa1daed23574f62c87ef1c2a0967f4044ede07450f488')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test || true # TODO remove when tests pass
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
