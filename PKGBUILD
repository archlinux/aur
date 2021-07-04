# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.1.0
pkgrel=1
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7c5ee82ee69fc49958ab099e45cacca5bbba3291a730aba6edd63665aed84aba3bd49cfc475e07371e4571037307b92544ea7e6895e2a29bb7d140173fe260a1')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
