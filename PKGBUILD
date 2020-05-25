# Maintainer: desbma
pkgname=zoxide
pkgver=0.4.1
pkgrel=1
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64')
url="https://github.com/ajeetdsouza/${pkgname}"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ajeetdsouza/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('14207cb8ce461fba2ff3568ed27fc322c27e2fabe629af71ed41e46e6bfca49b72b5bb3433c90198c12147581c2ffee5d53a42a82b911852dcf125611078298a')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
