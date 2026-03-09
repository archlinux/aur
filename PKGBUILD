# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=aweber-cli
_srcname=aweber-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI for the AWeber API"
url="https://github.com/andrewrabert/aweber-rs"
depends=()
makedepends=('cargo')
options=(!lto)
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$_srcname-$pkgver.tar.gz::https://github.com/andrewrabert/$_srcname/archive/v$pkgver.tar.gz")
sha256sums=('53423ccefece30bd4d8f3aeaf0ac85a17054974e7d5d50fa89220f96d04c1432')

build() {
  cd "$_srcname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$_srcname-$pkgver"
  install -Dm755 "target/release/aweber" "$pkgdir/usr/bin/aweber"
}
