# Maintainer: desbma
pkgname=zoxide
pkgver=0.2.0
pkgrel=2
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64')
url="https://github.com/ajeetdsouza/${pkgname}"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ajeetdsouza/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('830b07104ad20f3f8e18b22366100d1c8ad5ae3af8f56c0d55584c823c60e082cdbaeb8f5d575049fa34b6cb0a670f7392b5106405e248a8887d74544a96be45')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
