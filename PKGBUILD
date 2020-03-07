# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=speedtest-rs
pkgver=0.0.14
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('ff89d1e63e67282391e32b49a51fb70326d5351ae932ba35945ae473a6614c53d2af29cfd77fd4384ebdfa4515125b153d1238e4955ce1a284ac7fcf62786f1e')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

#check() {
#  cd $pkgname-$pkgver
#  cargo test --release --locked
#}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
