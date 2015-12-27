# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-script
pkgver=0.1.4
pkgrel=1
pkgdesc="Run Rust "scripts""
url="https://github.com/DanielKeep/cargo-script"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/DanielKeep/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4872eca8c1c4b5886d9f93c5d7e4af67187ceff0b56012be1d6e9a6b18336f31')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/run-cargo-script "$pkgdir/usr/bin/run-cargo-script"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
