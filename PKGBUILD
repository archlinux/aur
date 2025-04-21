# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudflarespeedtest-bin
_appname=CloudflareST
pkgver=2.2.5
pkgrel=4
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
sha256sums_aarch64=('8e00483443159c40885b6d204291ab7c1b7a2df85987ef94030072213afb6f5e')
sha256sums_armv7h=('d2e642bc38a4d24c9dbd4599cfda6ffe0115d4290a6fc1d0ece2b5a037c433bc')
sha256sums_i686=('9ffd4743cc458ead4ab58e48e1a4c5ee63b03d7ed9e917b9008169a0b84270ed')
sha256sums_x86_64=('ee6d4bd493ce50f3335c85d711963695acf354ac24f020baa1f194e932a6528b')
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