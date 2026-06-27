# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=matrix-archiver
pkgver=0.2.0
pkgrel=1
pkgdesc="Local incremental archiving of Matrix rooms"
url="https://github.com/andrewrabert/matrix-archiver"
depends=()
makedepends=('cargo')
options=(!lto)
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3585078737e55239366082e890120b9cf5324a2c8c15b509661b8b094cdd1c8b')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/matrix-archiver" "$pkgdir/usr/bin/matrix-archiver"
}
