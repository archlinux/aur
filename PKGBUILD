# Maintainer: CELESTIFYX Team <celestifyx@gmail.com>

pkgname="lynxfetch"
pkgver=1.1.0
pkgrel=1
pkgdesc="Super fast, versatile, and customizable command-line fetcher."
arch=("x86_64")
makedepends=("cargo")

source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("341c31abaead79100c22e1c002d681bfce05f02358ef46cf0e4083323f1038fdb0d10c9591aab203d2f85cb05bc3b6e30169d87d8906c4da082d807f1e7f2a63")

package() {
    cd "${pkgname}-${pkgver}"

    cargo build -r
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}
