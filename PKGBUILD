# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fscan-bin
_pkgname=FScan
pkgver=2.0.1
pkgrel=2
pkgdesc="An intranet comprehensive scanning tool.Written in Go,binary version.一款内网综合扫描工具，方便一键自动化、全方位漏扫扫描."
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://github.com/shadow1ng/fscan"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
options=(
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/shadow1ng/fscan/v${pkgver}/LICENSE.txt"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x32")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64")
sha256sums=('9e9a6cba6e93bb83c334d47b92861615b5be438e1076644ff64e7b0f35100379')
sha256sums_aarch64=('5632cd1f46d700e1feda86763bb6ba1ec40544b3192519ac7cc69f1cf96e83df')
sha256sums_i686=('aefc4547cffa43317720d5fda97042cd0baa42b9d0a959f8c2a408048577c39a')
sha256sums_x86_64=('15c3d2050d0ada6a54f49023a788aaee9d1b3141116a68614464306a587e12d0')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}