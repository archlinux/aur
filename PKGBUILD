# Mantainer: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=dezoomify-rs
pkgver=2.9.3
pkgrel=1
pkgdesc="Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others"
arch=('x86_64')
url="https://github.com/lovasoa/dezoomify-rs"
license=('GPL3')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lovasoa/dezoomify-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8025a6b8e4f647495d6fb776277cb9a1d977134c6395ed938bfea356e9a6194c')


build() {
	cd "$pkgname-$pkgver"
	cargo build -r
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
