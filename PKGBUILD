# Maintainer: Asimwe Landry <landryasimwe@gmail.com>
pkgname=blazetest-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="Blazing fast Rust speedtest CLI - Superior performance & accuracy"
arch=('x86_64' 'aarch64')
url="https://github.com/asimwe1/blazetest-rs"
license=('MIT')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/asimwe1/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad7cd828efb40774770cf884e87cb88b4499af97d47bf8164da1ad2592a30419')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
