# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>
_pkgname=jd
pkgname="${_pkgname}-tool-bin"
pkgver=1.9.0
pkgrel=1
pkgdesc="JSON diff and patch"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/josephburnett/jd"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/josephburnett/jd/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-arm64-linux")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-amd64-linux")
sha256sums=('7db445fe94ae6fb0c5ab69a6b47ec38a0e4b6d5a38f9d1493c0d8cb7c8ad2516')
sha256sums_aarch64=('4d8a0fa05b733b01c8aa4d30f536b947c7251f606930c4513760be8672fb222f')
sha256sums_x86_64=('a61c4d11d87e80a8f73ef72c8acb120199146c16b04b6b3ff840e18360aac5dc')
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}