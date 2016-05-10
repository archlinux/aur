# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rustfmt
pkgver=0.4.1
pkgrel=1
pkgdesc="A tool for formatting Rust code according to style guidelines"
url="https://github.com/rust-lang-nursery/rustfmt"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('1ce2f8db84b0a1ad705080c1f99ab0db02761577885709eb44a2b3cac4706dbd')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rustfmt "$pkgdir/usr/bin/rustfmt"
  install -Dm755 target/release/cargo-fmt "$pkgdir/usr/bin/cargo-fmt"
}
