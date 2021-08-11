# Maintainer: Gyara <laxect39@gmail.com>

pkgname=xtr
pkgver=0.1.6
pkgrel=1
pkgdesc="Translation tools for rust"
url="https://github.com/woboq/tr"
arch=("x86_64")
license=("AGPL")
depends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('e7d0e91ecbeee7ab326e8694585111437aa59ca00d51b8362a37eb01bfc83a973c8c9d9752d9cd1e3228795a3a4f98e79fbc62116e2155917afb7c4ddab3170d')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}

# vim: ts=2 sw=2 et:
