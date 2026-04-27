# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fscan-bin
_pkgname=FScan
pkgver=2.1.2
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
options=(
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/shadow1ng/fscan/v${pkgver}/LICENSE.txt"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x32")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64")
sha256sums=('9e9a6cba6e93bb83c334d47b92861615b5be438e1076644ff64e7b0f35100379')
sha256sums_aarch64=('a0154a9dcaa1c2e50327c5b392a166ea7c7369fd2d8b6c8532dae523de2f45b6')
sha256sums_armv7h=('228f944a16a7b207cd25cde8f130a1b36315d0346100779981eb70574ee6872c')
sha256sums_i686=('94b01ffabb3a2f1e116c35d137a4a9f5ee829db88558f0ebbcbedf8fc074024d')
sha256sums_x86_64=('859ee2ee778782c9274bd3c892be60ad1b4a9cd7c87a17fc8dc7a8c4565e31e3')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
