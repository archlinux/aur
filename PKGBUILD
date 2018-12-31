# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=textris
pkgver=0.2.0
pkgrel=1
pkgdesc='Tetris on terminal, written in Rust'
arch=('x86_64')
url=https://github.com/ryym/textris
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("textris-$pkgver.tar.gz::https://crates.io/api/v1/crates/textris/$pkgver/download")
sha512sums=('bdf9a2bd6ab844173fea5d66d0c7b44c95ed116b938b5b4d06bf04b233d3f165959fc2c6e03c26b372f2a45e94fb6ad62286bf9a0ff2d481a39469a51dac37ec')

build() {
  cd textris-$pkgver
  cargo build --release
}

check() {
  cd textris-$pkgver
  cargo test --release
}

package() {
  cd textris-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/textris
}

# vim:set ts=2 sw=2 et:
