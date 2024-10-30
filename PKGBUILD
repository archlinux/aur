# Maintainer: Snehit Sah <snehitsah@protonmail.com>
# Contributor/Past Maintainer: desbma

pkgname=i3-switch-tabs
pkgver=0.1.5
pkgrel=1
pkgdesc='Switch top-level tabs in i3-wm'
arch=('x86_64')
url="https://github.com/nikola-kocic/${pkgname}"
license=('MIT')
makedepends=('rust')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nikola-kocic/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ef009ca2622162b2cc20aa16cd9cae9913c563ab70af55f66d3f487a65bec9b5d290f38a28c790cebe30ae1e5c55b99a26940b3f1a031f71789e748691688239')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE
}
