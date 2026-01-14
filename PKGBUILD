# Maintainer: Glucy2 <glucy-2@outlook.com>

pkgname=ifrextractor-rs
pkgver="1.6.0"
pkgrel="1"
pkgdesc="Rust utility to extract UEFI IFR data found in a binary file into human-readable text."
arch=('any')
makedepends=('rust')
url="https://github.com/LongSoft/IFRExtractor-RS"
license=('BSD-2-Clause')

source=("https://github.com/LongSoft/IFRExtractor-RS/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=("ac69856138d1bf07698afff9d6d0f5873167bd56c6e460546869b14a16516c7d")

build() {
    cd "${srcdir}/IFRExtractor-RS-${pkgver}"
    cargo build --release
}

package() {
    install -Dm755 "${srcdir}/IFRExtractor-RS-${pkgver}/target/release/ifrextractor" "${pkgdir}/usr/bin/ifrextractor"
}
