# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fscan-bin
pkgver=2.0.0_build4
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
sha256sums_aarch64=('5a970b19aa8cfaa7ab2e0b10fa83514e9ff6f1a812993cffdf9eabbe213478bd')
sha256sums_armv7h=('953d98e1e6cfe78cb08e360b2add256775c5b9c13fa01f76b803ee2a0c5080b3')
sha256sums_i686=('34ecb512994e8a2452256e4902f8cf27f68f88f7441ca60d66dde4c149202a95')
sha256sums_x86_64=('ca3e00654122067718238437507d58a8e8f7b2d58438a4a0cb1545141be1ab05')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}