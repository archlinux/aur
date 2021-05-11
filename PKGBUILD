# Maintainer: Snehit Sah <snehitsah@protonmail.com>
# Contributor/Past Maintainer: desbma

pkgname=i3-switch-tabs
pkgver=0.1.4
pkgrel=1
pkgdesc='Switch top-level tabs in i3-wm'
arch=('x86_64')
url="https://github.com/nikola-kocic/${pkgname}"
license=('MIT')
makedepends=('rust')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nikola-kocic/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('7df79d1f8ce74f76cdce5a56b1d49c3808024dddf272cbe450999293b2472e0629a0db6dcd1ebb34fa1fcc38a036c8e1a2cff8bdf334e20be12e4369de77b157')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE
}
