# Maintainer: Bryan Malyn <bim9262 at gmail dot com>

pkgname=wl-gammarelay-rs
pkgver=0.2.2
pkgrel=1
pkgdesc="Like wl-gammarelay, but written in rust, runs on a single thread, has three times less SLOC and uses DBus (for simplicity)"
makedepends=('cargo')
arch=('any')
url="https://github.com/MaxVerevkin/wl-gammarelay-rs"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2e98a2f78071c531a5130ddfb4a5c1bd10ec4e357d74bc68b2344f5d9832ed9')
sha512sums=('23f9f82e6306b427399d8502205d1457fb1fb831825e69d88445330a0e32f5fab07747fba489a79b8e4a34d1b5da1aaf7006eaab825e7dec7c7e999ed915ffa6')
b2sums=('6f62ba870e92682d6a1a943baaa9c31f6382bee95211e4d99a550189354024529e3ecdcd14d3f22afce52d1f3af9f7446a9bc2c022501b64c222062ebc3b06cc')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
