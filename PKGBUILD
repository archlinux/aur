# Maintainer: Glucy2 <glucy-2@outlook.com>

pkgname=ifrextractor-rs
pkgver="1.6.1"
pkgrel="1"
pkgdesc="Rust utility to extract UEFI IFR data found in a binary file into human-readable text."
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv7h"
    "armv6h"
    "armv5tel"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "riscv64"
)
makedepends=('rust')
url="https://github.com/LongSoft/IFRExtractor-RS"
license=('BSD-2-Clause')

source=("https://github.com/LongSoft/IFRExtractor-RS/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=("5c03533c057194bd93ad9b3adb0076ba0ca584156102e12040e875999283403c")

build() {
    cd "${srcdir}/IFRExtractor-RS-${pkgver}"
    cargo build --release
}

package() {
    install -Dm755 "${srcdir}/IFRExtractor-RS-${pkgver}/target/release/ifrextractor" "${pkgdir}/usr/bin/ifrextractor"
}
