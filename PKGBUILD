# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a215a869dae3c7bddd3166c933d91b743db6718b5f8d0583147776eb82fb4915cfe945c34e33cdcdf337718a9bf8c59e81fa6f7eca215feeabb061343447a23a')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
