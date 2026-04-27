# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fabio-bin
pkgver=1.7.1
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
sha256sums_aarch64=('966c8d36c715c69c1e1e09738436e3aae2070b2c8378bdb5884a4c14b9c03d28')
sha256sums_armv7h=('89e41245faa4be5f14616238df1e982e627df7b88451e82f27c0814c66914b02')
sha256sums_i686=('af580737fb5577688a8b235d63e769aef1e0ccdc54bc7df57c2e1e74f2bfb375')
sha256sums_x86_64=('12e6cf138c0a54d37f6e87d1c5c7c78d0e69db1dabb1954ffacf2385cfe6d48d')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
