# Maintainer: Ross Chadwick <git at ross dot ch>

pkgname=hyprls
pkgver=0.12.0
pkgrel=1
pkgdesc="A LSP server for Hyprland config files"
arch=('any')
url="https://github.com/hyprland-community/hyprls"
license=('MIT')
optdepends=('hyprland')
makedepends=('go' 'just')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3a749405a88d5f8cd18eb830ad34aab0044bb0eca2b390b471c5bfb61aca21f8c2ba39ce7ffe4eb4859ca38b4195ecfbdab3f8585b5a11b5ca00f90858ec9e13')

build(){
    cd "${pkgname}-${pkgver}"
    just build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"/README.md
}