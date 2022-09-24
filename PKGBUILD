# Maintainer: Noah Gil <xlash19o13@gmail.com>
pkgname=streamspeed
pkgver=2.0.0
pkgrel=1
epoch=0
pkgdesc="A simple Rust program that prints the transfer speed of stdin"
arch=('x86_64')
url="https://github.com/xlash123/streamspeed"
license=('GPL')
source=("https://github.com/xlash123/streamspeed/archive/refs/tags/${pkgver}.zip")
sha256sums=('dba54e63f135bab23c2225e8e450839d2db408bb83f5d03a0966a3548aff0242')
makedepends=('rust')

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm775 target/release/streamspeed "$pkgdir/usr/bin/streamspeed"
}
