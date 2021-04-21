# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname=edgedb-cli
pkgver=1.0b1
pkgrel=1
pkgdesc="Command-line tools for edgedb"
arch=("x86_64")
url="https://github.com/edgedb/edgedb-cli"
license=("MIT" "APACHE")
makedepends=("rust" "cargo")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("a675eac7f9ee382722499b476f4f9eed5e1956191ddc56b4256fb8730d1a396e41e7afe7a6141ce02c1c00c267452c4d1688e9047e77c44a50db6ffe48c2b37b")

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
