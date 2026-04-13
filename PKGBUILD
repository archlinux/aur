# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Tony Fettes <tonyfettes@tonyfettes.tk>
pkgname=tunasync-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/tuna/tunasync"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-arm64-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-amd64-bin.tar.gz")
sha256sums_aarch64=('505bf437909893190403299550a7cb77c06a154791731d28c1c5e13b4809cd5d')
sha256sums_x86_64=('a0fd99e18b9b04c1b30e610d24915ab3a1d5cfdb669358659a7719815e651411')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}tl" -t "${pkgdir}/usr/bin"
}
