# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=5.5.6
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
_pkgname="miru"
source_x86_64=(
    "https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb"
    "${_pkgname}.desktop"
)
sha512sums_x86_64=(
    '7ddc3397ae6c3116f6fd4b945bd8b849d84ddd286e5e8e674c75831cfc17e02a7e183692393cf8fe991fd67352857c210226c0e8d7ac9925506a9c5a9d720fd7'
    '10ffce928a1f1785c78b23bd928e718a49f2243418aadd6e4537d83151c920ab270d7345e54646ae65351f855bdd41e41a9d3f0a94a128d618d85d9cc59e1e06'
)

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 ${srcdir}/${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
