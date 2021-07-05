# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.1.1
pkgrel=1
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2e489680a7f9cb4722f4c3ec5ca4846106fc58c7258236dfeb2570937c964c142bafe09d3344ea6285b2e88d14ff84ec431bc8e473d4d6f3da2b3dc3f944941d')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
