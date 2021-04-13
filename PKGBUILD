# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ae9adcc88adc542cc95220271a6446dd2ffb2ee8ce32092f56e107109e890cba2cd0c03e88240a44114bc3e09e97c22cddc9211f90769c935d165791750c005a')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
