# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=speedtest-rs
pkgver=0.1.3
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('4afd4e77623f14ef0ea18135fe4a0d0f4ce145aa28a58fa2fd6478995889ae2e4b63bbaf39e08e56f7001c3bcef49130028032e6052dffea08d3012591991504')

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
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
