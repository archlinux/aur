# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=conserve
pkgver=0.6.6
pkgrel=1
pkgdesc="Robust portable backup tool written in Rust"
arch=('x86_64')
url="https://github.com/sourcefrog/conserve"
license=('GPL2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1dac59f716977d62cffd41c1c151f903aabd6a769026d8b0c607da1e5ff575ed14aaf7f580973f50194528b69654a6200655180fb831350209cffd605aa1015d')

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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
