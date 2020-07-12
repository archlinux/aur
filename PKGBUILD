# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=speedtest-rs
pkgver=0.0.15
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('3f581a23420e14f9cd4d04028ab2888681a96b5c6f01d2bbc711a8745377c5debfb9dfb6261d18483308327ed9fc9839d56727ac3d9146de4da7e5a864102ef4')

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
