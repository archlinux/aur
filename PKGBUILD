# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rustfmt
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool for formatting Rust code according to style guidelines"
url="https://github.com/rust-lang-nursery/rustfmt"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('c2d860213f6e653527de316bdd9bf4fa821cc3c3b052540885a26653e7a77288')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rustfmt "$pkgdir/usr/bin/rustfmt"
  install -Dm755 target/release/cargo-fmt "$pkgdir/usr/bin/cargo-fmt"
}
