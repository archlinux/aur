# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname=edgedb-cli
pkgver=1.0a7
pkgrel=1
pkgdesc="Command-line tools for edgedb"
arch=("x86_64")
url="https://github.com/edgedb/edgedb-cli"
license=("MIT" "APACHE")
makedepends=("rust" "cargo")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("a240491bc5f38dcd3548078c74cbc9fb84af650292e2a310cb371829fb3faca55e863dbc1f73ea24536c0efd84950b6d5e154765eae15a5f31ba48524048ddda")

build() {
  cd $pkgname-$pkgver
  cargo build --release --target-dir "target/"
}

package() {
  cd $pkgname-$pkgver
  install -D target/release/edgedb -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 LICENSE-APACHE -t "$pkgdir"/usr/share/licenses/$pkgname
}
