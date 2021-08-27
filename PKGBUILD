# Maintainer: Funami

pkgname=cargo-nono
pkgver=0.1.9
pkgrel=1
pkgdesc="A cargo subcommand to detect (possible) no_std compatibility of your crate and dependencies"
url="https://github.com/hobofan/cargo-nono"
license=('APACHE' 'MIT')
arch=('x86_64')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d197cd6cea7c40ae9ad969d7bd1cc79573c3cbe9619cfd201fcba7bfaf29dc0a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
