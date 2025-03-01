# Maintainer: Glucy2 <glucy-2@outlook.com>

pkgname=ifrextractor-rs
pkgver="1.5.1"
pkgrel="3"
pkgdesc="Rust utility to extract UEFI IFR data found in a binary file into human-readable text."
arch=('any')
makedepends=('rust')
url="https://github.com/BoringBoredom/UEFI-Editor"
license=('BSD-2-Clause')

source=("https://github.com/LongSoft/IFRExtractor-RS/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=("82b8602d255af935fb6debcbcb75384618efd2e10c0cadcada74cc679509121e")

build() {
    cd "${srcdir}/IFRExtractor-RS-${pkgver}"
    cargo build --release
}

package() {
    install -Dm755 "${srcdir}/IFRExtractor-RS-${pkgver}/target/release/ifrextractor" "${pkgdir}/usr/bin/ifrextractor"
}
