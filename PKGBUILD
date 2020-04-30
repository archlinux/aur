# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark
pkgver=0.7.1
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/raphlinus/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("pulldown-cmark-$pkgver.tar.gz::https://crates.io/api/v1/crates/pulldown-cmark/$pkgver/download")
sha512sums=('c3b5bb456b9ac0fb1406f0815ed665abbacb25e449aa1bccfd1e5fc1b813cb0548dc84cc252b7746bffe791b6acbccab5ac6ecbba8e88bdda1241b0337d21614')

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
