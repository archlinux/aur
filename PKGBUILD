# Maintainer: ImVILLS <ваш@email.com>
pkgname=neocash
pkgver=1.0.1
pkgrel=1
pkgdesc="Modern shell with advanced features"
arch=('x86_64')
url="https://github.com/ImVILLS/neocash"
license=('MIT')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('66649774162ae3c0757682ec3f10690abe4173e27ae593808b6e959eea9af661')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/neocash" "$pkgdir/usr/bin/neocash"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
