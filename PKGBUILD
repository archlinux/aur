# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname=edgedb-cli
pkgver=1.0a6
pkgrel=1
pkgdesc="Command-line tools for edgedb"
arch=("x86_64")
url="https://github.com/edgedb/edgedb-cli"
license=("MIT" "APACHE")
makedepends=("rust" "cargo")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("51461963bf98962a2e68bc6cac9f9f061ac24541c446999eae781d275ebc7f96af9761a03accfeb64d15818be886e4bfab69c9e51410af2e8df9a4229462e704")

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
