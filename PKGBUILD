# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=hex
pkgver=0.3.0
pkgrel=1
pkgdesc="Futuristic take on hexdump"
arch=('x86_64')
url="https://github.com/sitkevij/hex"
license=(MIT)
depends=('gcc-libs')
makedepends=('git' 'rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/sitkevij/hex/archive/v${pkgver}.tar.gz)
sha512sums=('e57d221f3853b4cabcc604cc3c7e2ab00f75670ae38fbd68c3b5beb2302c732a36b79bc102dd2cd48b75bdf6de86f537dee4d916a04b919fe4d7208c3f2fa645')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo test --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/hx "$pkgdir"/usr/bin/hx
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}

# vim:set ts=2 sw=2 et:

