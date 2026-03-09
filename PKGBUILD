# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=aweber-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for the AWeber API"
url="https://github.com/andrewrabert/aweber-rs"
depends=()
makedepends=('cargo')
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d79a819301dea4f5e006255070c4dcb10bdb3208514cd0b74642071b0a354987')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/aweber" "$pkgdir/usr/bin/aweber"
}
