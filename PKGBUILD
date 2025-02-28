# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Tony Fettes <tonyfettes@tonyfettes.tk>
pkgname=tunasync-bin
pkgver=0.9.2
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-bin.tar.gz")
sha256sums_aarch64=('564652dbd11aa045d1bb374f675eefc458c8c604abb1583542136930f4880d9a')
sha256sums_x86_64=('06a4ec498d5d27afa05c813785d2ca285a8199d70e488ea430370c63931dec8c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}tl" -t "${pkgdir}/usr/bin"
}