# Maintainer: Andrew Halle <me at andrewhalle dot dev>

pkgname=rpick
pkgver=0.9.1
pkgrel=1
pkgdesc="A command line tool that helps you to pick items from a list, using configurable algorithms."
arch=('x86_64')
url="https://github.com/bowlofeggs/rpick"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bowlofeggs/rpick/archive/$pkgver.tar.gz")
sha256sums=('1f4d2d13e1825e5edc22bb196285c67d15338e5648b27db73c7d96fa5fbe6df9')

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
