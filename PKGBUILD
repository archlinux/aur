# Mantainer: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=dezoomify-rs
pkgver=2.9.4
pkgrel=1
pkgdesc="Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others"
arch=('x86_64')
url="https://github.com/lovasoa/dezoomify-rs"
license=('GPL3')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lovasoa/dezoomify-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a380d3685a4b9cbc9b8642bc1fd1d5ce2d08823f87f5df0da7bb976580b95aea')


build() {
	cd "$pkgname-$pkgver"
	cargo build -r
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
