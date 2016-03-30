# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rustfmt
pkgver=0.4.0
_pkgver=0.4
pkgrel=1
pkgdesc="A tool for formatting Rust code according to style guidelines"
url="https://github.com/rust-lang-nursery/rustfmt"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("https://github.com/rust-lang-nursery/$pkgname/archive/v$_pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('770c66dc845424a0c9a7f51b47d8de1e2605298da9b257ddde1d5be6fe01331f')

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 target/release/rustfmt "$pkgdir/usr/bin/rustfmt"
  install -Dm755 target/release/cargo-fmt "$pkgdir/usr/bin/cargo-fmt"
}
