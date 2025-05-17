# Maintainer: Your Name <your.email@example.com>
pkgname=filefetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A folder info fetcher written in Rust"
arch=('x86_64')
url="https://github.com/gummyniki/filefetch"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/filefetch" "$pkgdir/usr/bin/filefetch"
}
