# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.1.2
pkgrel=1
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8bb66a88ebdb9f4913427bf1b5cedb8a5c5912dd537a5933a0a23c808f1ceabc1a4cf615519406fad2cc52f575de168cdf15449cc9d7bcb369c657c18b07b75c')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
