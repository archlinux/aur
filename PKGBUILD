# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"
pkgver=0.2025.01.08.08.02.stable_03
pkgrel=1
pkgdesc="Warp is the intelligent terminal with AI and your dev team's knowledge built-in."
arch=('x86_64' 'aarch64')
url="https://proxyman.io"
license=('custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
depends=()
source=(
    "${pkgname%-bin}-x86_64.pkg.tar.zst::https://releases.warp.dev/stable/v${pkgver}/warp-terminal-v${pkgver}-1-$CARCH.pkg.tar.zst"
    "LICENSE.txt"
)
sha256sums=(
            'a36263627ce78b430ce14353a0d41c77604b991822143b58e66dc14a5503d693'
            'da704590c6bd3a8b0ad179b42961e1feb10faa87f5eb3a3851ba2d940b49ebfa'
           )

build() {
    rm -f *.zst .*
    install -Dm644 "${srcdir}/LICENSE.txt" "${srcdir}/opt/warpdotdev/warp-terminal/"
    rm LICENSE.txt
}

package() {
    cp -a "${srcdir}/." "${pkgdir}"
}
