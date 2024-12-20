# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fscan-bin
pkgver=2.0.0_build1
pkgrel=1
pkgdesc="An intranet comprehensive scanning tool.Written in Go,binary version.一款内网综合扫描工具，方便一键自动化、全方位漏扫扫描."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/shadow1ng/fscan"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/shadow1ng/fscan/${pkgver//_/-}/LICENSE.txt"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/${pkgver//_/-}/${pkgname%-bin}_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${url}/releases/download/${pkgver//_/-}/${pkgname%-bin}_armv7")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${url}/releases/download/${pkgver//_/-}/${pkgname%-bin}32")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/${pkgver//_/-}/${pkgname%-bin}")
sha256sums=('9e9a6cba6e93bb83c334d47b92861615b5be438e1076644ff64e7b0f35100379')
sha256sums_aarch64=('ba214139292529ac6e9f68cd9aa7e37f10f1496223294fdefcfd7e85e83fe9e7')
sha256sums_armv7h=('8a9cb04038cbd91d37b3b3030c9d7ec47e45c6c51e52290234c075470d048595')
sha256sums_i686=('8733b5a9650648f8582657a19774c84dcf2dd5a170d1dc9a806a93202c6181c6')
sha256sums_x86_64=('ea7026e23a48f80621313db25f77b733ca6545b74d979889cf1756d49ec03bf4')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
