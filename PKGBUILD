# Maintainer: desbma
pkgname=i3-switch-tabs
pkgver=0.1.3
pkgrel=1
pkgdesc='Switch top-level tabs in i3-wm'
arch=('x86_64')
url="https://github.com/nikola-kocic/${pkgname}"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nikola-kocic/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('eb65ddca5c62098064a0c034e8aa0a715e5f7b2d74f56353abeadb26ffdff3290647eb27ebcbd372fcd3049af0dcb99875bc0becdcf9b4666537fa11c1b1d711')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE
}
