# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rustfmt
pkgver=0.3.0
_pkgver=0.3
pkgrel=1
pkgdesc="A tool for formatting Rust code according to style guidelines"
url="https://github.com/rust-lang-nursery/rustfmt"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("https://github.com/rust-lang-nursery/$pkgname/archive/v$_pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('11593eedc0dc5186d3d8cd7a9f31ea0ade4b4dcf047c7520298bb26e2e5509f7')

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 target/release/rustfmt "$pkgdir/usr/bin/rustfmt"
  install -Dm755 target/release/cargo-fmt "$pkgdir/usr/bin/cargo-fmt"
}
