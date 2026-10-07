# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fscan-bin
_pkgname=FScan
pkgver=2.2.2
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
depends=()
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/shadow1ng/fscan/v${pkgver}/LICENSE.txt"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x32")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64")
sha256sums=('9e9a6cba6e93bb83c334d47b92861615b5be438e1076644ff64e7b0f35100379')
sha256sums_aarch64=('cfa5a78adc0b310811af11c0b9bdaaeda0d8443d271ad2c0b28b8b52064eb9fe')
sha256sums_armv7h=('d668909c5a0ce0272e229335f4b4c044d4d9d353a8485940fd4c94a4c6cf0bc8')
sha256sums_i686=('97ce8333990e3c1ffc20c86b84e56cf97aaeb3a507107cb91d39d9300956c3db')
sha256sums_x86_64=('e5c645434b4fb3b9bfa8d7402e2e6e80189c9ec9533ebdc8620aaace686cd84c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}