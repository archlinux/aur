# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname=edgedb-cli
pkgver=1.0a5
pkgrel=1
pkgdesc="Command-line tools for edgedb'"
arch=("x86_64")
url="https://github.com/edgedb/edgedb-cli"
license=("MIT" "APACHE")
makedepends=("rust" "cargo")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("0f29aa4e9978f7538f0cbb1f41cd1428e06349b0f05ea69b41e6fac16d4705d1772bf090826ca81c4584c239bcad998608f95e635b6eff677e982fed7e1595c7")

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
