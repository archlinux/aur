# Maintainer: Andrew Halle <me at andrewhalle dot dev>

pkgname=rpick
pkgver=0.8.13
pkgrel=1
pkgdesc="A command line tool that helps you to pick items from a list, using configurable algorithms."
arch=('x86_64')
url="https://github.com/bowlofeggs/rpick"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bowlofeggs/rpick/archive/$pkgver.tar.gz")
sha256sums=('ff144caf8b410a91cf6b865ec680acd4ca209816506adee355435569bc0283a5')

build() {
	cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"
  cargo test
}

package() {
	cd "$pkgname-$pkgver"
  install -Dm755 target/release/rpick $pkgdir/usr/bin/rpick
}
