## Maintainer: edwloef

pkgname=flow-control-bin
_pkgname=flow-control
__pkgname=flow
pkgver=0.5.0
pkgrel=1
pkgdesc="a programmer's text editor"
arch=('x86_64')
url="https://github.com/neurocyte/$__pkgname"
license=('MIT')
optdepends=('ripgrep: project-wide search')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/neurocyte/$__pkgname/releases/download/v$pkgver/$__pkgname-v$pkgver-linux-x86_64.tar.gz"
        "https://raw.githubusercontent.com/neurocyte/$__pkgname/refs/tags/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/neurocyte/$__pkgname/refs/tags/v$pkgver/contrib/$_pkgname.desktop"
        "https://raw.githubusercontent.com/neurocyte/$__pkgname/refs/tags/v$pkgver/contrib/icons/192x192/$_pkgname.png")
sha256sums=("3b3e3895348ffd198dd766b7fba6c702e9aeeadf6715547fd820343ce85088ae"
            "a94267d8368fada2db5e129000c201ec7c8f58793c79fb26e4872c50bf28e3f8"
            "7ccb13c6b1621e3579990d37cae92f65f9a06da0b5c6572e8f83a5d8468b9fde"
            "efd9ec7bbb7cb74cce9ed5037db406bb111425b5325164c1a01cf86514ca3979")

package() {
    install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
