# Maintainer: CELESTIFYX Team <celestifyx@gmail.com>

pkgname="lynxfetch"
pkgver=1.1.1
pkgrel=1
pkgdesc="Super fast, versatile, and customizable command-line fetcher."
arch=("x86_64")
makedepends=("cargo")

depends=("glibc"
    "gcc-libs"
    "pkg-config"
    "libdrm"
    "dbus")

source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("ba05ba6e1b652094c4ec1849dc6d31858c0d4141a5fb362c6a5224bbfb459f71abe29901b2263a85ab3df6cbef273b9e5d16879b1d76fff476f53ac410ba8e2c")

package() {
    cd "${pkgname}-${pkgver}"

    cargo build -r
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}
