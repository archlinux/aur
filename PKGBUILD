# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudflarespeedtest-bin
_appname=cfst
pkgver=2.3.1
pkgrel=1
pkgdesc="XIU2/CloudflareSpeedTest 🌩 'Choose Your Own Preferred IP' Test Cloudflare CDN latency and speed, get the fastest IP! Written in go.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/XIU2/CloudflareSpeedTest"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_linux_arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_linux_armv7.tar.gz")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_linux_386.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_linux_amd64.tar.gz")
sha256sums_aarch64=('8f6da1a7331ce96fa6c7b06452b3d36aea1244d202218b6ccfe9bd5c1da66516')
sha256sums_armv7h=('bc235a206d07d51d4ac3d8f467a1e1ce794607bce2c67c206cef55301d3066e2')
sha256sums_i686=('c992a6ed48d33bf77d2a2540d7cc0239acadc601520fabf683bc4619a285b150')
sha256sums_x86_64=('066c01884202853566535b7d4e8dbb1c06e70b7341fd61449d572ec6fd4fbca5')
prepare() {
    mv "${srcdir}/使用+错误+反馈说明.txt" "${srcdir}/ReadMe.txt"
}
package() {
    install -Dm755 "${srcdir}/${_appname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/"*.txt -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/cfst_hosts.sh" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/cfst_hosts.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}