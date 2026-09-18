# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=aweber-cli
pkgver=0.7.0
pkgrel=1
pkgdesc="CLI for the AWeber API"
url="https://github.com/andrewrabert/aweber-cli"
depends=()
makedepends=('cargo')
options=(!lto)
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('14d6a95a8bf42813130bda9bcf4e048491af5232ef0fb4f5560e076f6ea011b3')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/aweber" "$pkgdir/usr/bin/aweber"
}
