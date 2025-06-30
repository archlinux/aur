# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudflarespeedtest-bin
_appname=CloudflareST
pkgver=2.3.0
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
sha256sums_aarch64=('cc62773d3c41e00e3530afe089bfba61f79b7dc5cd6e359b527d94f69ba035ad')
sha256sums_armv7h=('31b6528d8421510e2fce91492ad217a8b6b59ee8f4f8dec57245784055fe02ad')
sha256sums_i686=('4cc6bf873d59ad507c0599d66e41849f7cd201fa0eb2d705ce734ca8c363e8a4')
sha256sums_x86_64=('d0ba6c82ac63bf014fac8cb8219f18ec8f644613e1fa3f4e040fc7770dbddec1')
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
