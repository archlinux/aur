# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fscan-bin
_pkgname=FScan
pkgver=2.2.1
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
sha256sums_aarch64=('3d926c6d457e4f9a633fe0c8e96eded00830a2529b6b5c4734af0dfaae96ed96')
sha256sums_armv7h=('53a0a494e70c544a4c991e284c861bc758d68bb1b37c89e7d53c783e81902069')
sha256sums_i686=('3b9aee8006dba2f87cca151d132293fb3118cdba527c8fcc42eb1de3a0a26d4c')
sha256sums_x86_64=('b811e80f18b900458a264df5eab5b8515e48a50ca06810722fbb823aa109e76b')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
