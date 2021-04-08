# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=zoxide
pkgver=0.6.0
pkgrel=1
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64')
url="https://github.com/ajeetdsouza/${pkgname}"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ajeetdsouza/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('7a4be9e9d3b3c99b2a4535de0563dbb18542449aebf003889c6eb45293e43d51b0f347cd9a50c8a1e11170f3c65eb59d22ec3dcd8419b8a5d72974a7a566ad95')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
