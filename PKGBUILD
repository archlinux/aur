# Mantainer: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=dezoomify-rs
pkgver=2.11.2
pkgrel=1
pkgdesc="Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others"
arch=('x86_64')
url="https://github.com/lovasoa/dezoomify-rs"
license=('GPL3')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lovasoa/dezoomify-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19bcd079d8a370456080ba65b2f51fa4aa2eee00207a18aa9782dd7faef9acb9')


build() {
	cd "$pkgname-$pkgver"
	cargo build -r
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
