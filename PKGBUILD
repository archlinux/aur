# Maintainer: Ross Chadwick <git at ross dot ch>

pkgname=hyprls
pkgver=0.14.0
pkgrel=1
pkgdesc="A LSP server for Hyprland config files"
arch=('any')
url="https://github.com/hyprland-community/hyprls"
license=('MIT')
optdepends=('hyprland')
makedepends=('go' 'just')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e4daecfb583c958a02860afee723fa31b1b70015d2c285149d4fbdbb62a432ea75f3c055d5b22c9c6dd9b6c09da06da97e76bb45dbe4b26ab65e44e94d226cc8')

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
