# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fabio-bin
pkgver=1.6.4
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
sha256sums_aarch64=('1e2914827f87bfb28f17386b15f16b745f807a564653e170eccbe71242245509')
sha256sums_armv7h=('050f42f2b68ec8f2eda8eb72a66aef68e13893217ca022d18e987c0dd1e2c349')
sha256sums_i686=('108077a7e30613ea4ee2bd3ea523d65b799eb13e3f5d928c71baab4356b3947c')
sha256sums_x86_64=('0b8ed4ef36a316ba67a990e00913375fa8d8c0303c6c05b1234f7d796d9a946e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
