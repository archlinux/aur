# Maintainer: Ross Chadwick <git at ross dot ch>

pkgname=hyprls
pkgver=0.13.0
pkgrel=1
pkgdesc="A LSP server for Hyprland config files"
arch=('any')
url="https://github.com/hyprland-community/hyprls"
license=('MIT')
optdepends=('hyprland')
makedepends=('go' 'just')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('60692de02760d847021d92ce76376a5fc6beb4e06b9c19ac2f6e4cf621bd7a0509cf419c6b6dce7ebfd75d8f190d740ec15210c747564de56d721336db680ff7')

build() {
    cd "${pkgname}-${pkgver}"
    just build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"/README.md
}
