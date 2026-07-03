# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fabio-bin
pkgver=1.7.2
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
sha256sums_aarch64=('79bd82b2382eace1ff30b8c1a6d006d3736f915815e5822022be7dfa14862a26')
sha256sums_armv7h=('dc1e731d142b52af7637ef7b15f56515df9e604c883fdf9723589190036d6ac3')
sha256sums_i686=('c4fb5b94a288b893c7d234fb71277d48de61d6bd0c1a11438b296ebbf1b42359')
sha256sums_x86_64=('4f3f51593a7e997b555c8d63dc50d110ec5b28b893f1de11be2910609e1932bc')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
