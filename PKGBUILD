# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fabio-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A fast, modern, zero-conf load balancing HTTP(S) and TCP router for deploying applications managed by consul."
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
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/fabiolb/fabio/v${pkgver}/LICENSE")
sha256sums=('1b96863084c41c1557336dad7193f7b0d4c03042481da83136b53940ea5a3083')
sha256sums_aarch64=('58b22bae9224191c9cbe3d778b79fcde856f57266d20cdb65b729343f65d3f42')
sha256sums_armv7h=('12612c889d6f6868a94d9727155e61f03ffee2aaf6019ea738a2264abb915a3c')
sha256sums_i686=('2374a29b296f78831d6072abbf96f5b2ef140641afe489fb64e11bd2ec6923cb')
sha256sums_x86_64=('ee4a8cff6ad13256249263926f186b6ce9c9678d13dcc1f4ecab73937c7db6f9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
