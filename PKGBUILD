# Mantainer: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=dezoomify-rs
pkgver=2.8.0
pkgrel=1
pkgdesc="Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others"
arch=('x86_64')
url="https://github.com/lovasoa/dezoomify-rs"
license=('GPL3')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lovasoa/dezoomify-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f31c4386303930589f6e3a2fec10de06ff7f2aef35c3fde761732dfb5712111')


build() {
	cd "$pkgname-$pkgver"
	cargo build -r
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
