# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudflarespeedtest-bin
_appname=cfst
pkgver=2.3.3
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
sha256sums_aarch64=('35ab668e49ce7c30288fa1fdcb47b4b282daa696a996edce51e32c320a2e96d1')
sha256sums_armv7h=('0945612b0252689dde8e4f15db75b852723252eb87f3011cd740f7b9064f5a56')
sha256sums_i686=('f3a74fd01672b3e2780a954fc617d7be9226d1f311a1e47827828bcbc2ecb16f')
sha256sums_x86_64=('fc64865daccb6745eeb1f6a06d09b3107a5c93c4473ca9a530a7d652d66aed68')
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
