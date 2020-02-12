# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark
pkgver=0.7.0
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/raphlinus/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("pulldown-cmark-$pkgver.tar.gz::https://crates.io/api/v1/crates/pulldown-cmark/$pkgver/download")
sha512sums=('e4d549f48be2bd49c9df05a5a098c8618009d6fdd0bca32ee0c364cc54274b958938830a2ae2c8fd68919e12d2423511e91487e0207bcc42f7df15197ed0834c')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
