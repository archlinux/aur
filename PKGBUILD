# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nginx-ui-bin
_pkgname='Nginx UI'
pkgver=2.6.2
pkgrel=1
pkgdesc="Yet another WebUI for Nginx."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://nginxui.com/"
_ghurl="https://github.com/0xJacky/nginx-ui"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nginx'
)
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm64-v8a.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm32-v7a.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-32.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-64.tar.gz")
sha256sums_aarch64=('b57b0f19b4e98f6077ed093e8a9a38bccc290a6f3dd7c0650be18a69cfcafbf2')
sha256sums_armv7h=('a8c0c09bf48ed72a1549e941b5037df09971a83a117e7174a80e4fdc57b1e610')
sha256sums_i686=('f66876c757190a03162248464748c817f9138c8431ea5fc4b2c2ce6a9465f420')
sha256sums_x86_64=('16bd711462cc3a24babfa43a4989f1823f1755046a428c4165a3eaa2d14d78a1')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/README"* -t "${pkgdir}/usr/share/docs/${pkgname%-bin}"
}
