# Maintainer: jaskir

pkgname=wayle
pkgver=0.1.0
pkgrel=1
pkgdesc="A highly configurable Wayland panel/bar. (early development)"
arch=('x86_64')
url="https://github.com/Jas-SinghFSU/wayle"
license=('GPL-3.0-only')
depends=('gtk4')
makedepends=('git' 'rust' 'cargo')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

