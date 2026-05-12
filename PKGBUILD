# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=matrix-archiver
pkgver=0.1.0
pkgrel=1
pkgdesc="Local incremental archiving of Matrix rooms"
url="https://github.com/andrewrabert/matrix-archiver"
depends=()
makedepends=('cargo')
options=(!lto)
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f8d137ed746ecd286faa2fb46341efde365402f98c9c2f112a1977fda6c5a0b5')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/matrix-archiver" "$pkgdir/usr/bin/matrix-archiver"
}
