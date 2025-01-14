# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"
pkgver=0.2025.01.08.08.02.stable_04
pkgrel=1
pkgdesc="Warp is the intelligent terminal with AI and your dev team's knowledge built-in."
arch=('x86_64' 'aarch64')
url="https://warp.dev"
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
            '1c74271f84aa8eeebc442059c54a66765a4deb148c07edda97cc0a80bbaf3d5b'
            '341bc0f8670640fab789d19f4e6e8e9da0fc282531fddae976c52f431798641d'
           )

build() {
    rm -f *.zst .*
    install -Dm644 "${srcdir}/LICENSE.txt" "${srcdir}/opt/warpdotdev/warp-terminal/"
    rm LICENSE.txt
}

package() {
    cp -a "${srcdir}/." "${pkgdir}"
}
