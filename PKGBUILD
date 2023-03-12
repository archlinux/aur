# Mantainer: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=dezoomify-rs
pkgver=2.10.0
pkgrel=1
pkgdesc="Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others"
arch=('x86_64')
url="https://github.com/lovasoa/dezoomify-rs"
license=('GPL3')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lovasoa/dezoomify-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1b823f3de3b3ab1c8ffaefc45100cebd548b1f0b93a2b8ceb3ee88899a41e8f8')


build() {
	cd "$pkgname-$pkgver"
	cargo build -r
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
