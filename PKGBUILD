# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=aweber-cli
pkgver=0.5.1
pkgrel=1
pkgdesc="CLI for the AWeber API"
url="https://github.com/andrewrabert/aweber-cli"
depends=()
makedepends=('cargo')
options=(!lto)
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewrabert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6824f31b3e67bf1e37e32da3f0732f227a716ea934fabbbcabbe77fb9b3c4f27')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/aweber" "$pkgdir/usr/bin/aweber"
}
