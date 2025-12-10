# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fabio-bin
pkgver=1.6.11
pkgrel=1
pkgdesc='A fast, modern, zero-conf load balancing HTTP(S) and TCP router for deploying applications managed by consul.(Prebuilt version)'
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://fabiolb.net"
_ghurl="https://github.com/fabiolb/fabio"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_arm")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_386")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_amd64")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fabiolb/fabio/v${pkgver}/LICENSE"
)
sha256sums=('1b96863084c41c1557336dad7193f7b0d4c03042481da83136b53940ea5a3083')
sha256sums_aarch64=('dc44cfac2fc72363b7444642a81a2bcfa8bc39c2ffe7f14c693cb0baa10e3368')
sha256sums_armv7h=('804565a4b701e0a896091ae3d5c8ed2600ca5bf12ecae1f9bb4d8677a5806995')
sha256sums_i686=('3346ab39f20dfa1566acde81a068d6c94dc29cabb34c08da343fa13a7e7f5fc3')
sha256sums_x86_64=('56a983b4a8ce49867dab383657280a53d4e7b724c48661888b4ec02ecefabad9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
