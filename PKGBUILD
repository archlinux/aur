# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudflarespeedtest-bin
_appname=cfst
pkgver=2.3.2
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
sha256sums_aarch64=('813c76fe716c0300f52f07f0c7b204fb81df6397f07d6254a30154c064d4e411')
sha256sums_armv7h=('b06181bfef4f2dac6cd367222ff711b4005493c102317ed63ce39efd68c53662')
sha256sums_i686=('8015de6f8e81bfd2068119d26cc615930fcd2706399e50a3c6b1c0c06691c988')
sha256sums_x86_64=('4e1d52487e0d53e773a31d8da1c29f3783bf8a6e13eb12ba5738c7ba52e79a0e')
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
