# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=aweber
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI for the AWeber API"
url="https://github.com/andrewrabert/aweber-rs"
depends=()
makedepends=('cargo')
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/aweber-rs/archive/v$pkgver.tar.gz")
sha256sums=('53423ccefece30bd4d8f3aeaf0ac85a17054974e7d5d50fa89220f96d04c1432')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/aweber" "$pkgdir/usr/bin/aweber"
}
