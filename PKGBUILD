# Maintainer: Funami

pkgname=cargo-clone
pkgver=0.1.4
pkgrel=1
pkgdesc="A cargo subcommand to fetch the source code of a Rust crate"
url="https://github.com/JanLikar/cargo-clone"
license=('APACHE' 'MIT')
arch=('x86_64')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('780cf44ecfc22974e6f7bf17ad98893450780f5cf47b86dbe47cda4eb12c212a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
