# Maintainer: Cyridge cyridge@proton.me
pkgname=lavat
pkgver=3.0.0
pkgrel=1
pkgdesc="Little program that simulates a lava lamp in the terminal."
arch=('x86_64')
url="https://github.com/AngelJumbo/lavat"
license=('MIT')
depends=()
provides=('lavat')
conflicts=('lavat-git')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AngelJumbo/lavat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c5364203a75395953560b173fae90c316b753a046acb8f557c9e684eec6d76ba')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ./lavat "$pkgdir/usr/bin/$pkgname"
}
