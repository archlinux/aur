# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=nostromo-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="CLI for building powerful aliases."
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://nostromo.sh"
_ghurl="https://github.com/pokanop/nostromo"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_i386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('9a7a58d8feb1764421845d9a03e1c9ff79906eefd6150c0d595afdabaf177ebb')
sha256sums_i686=('6622ee24902f98abf1078172aa02a7e27745a4fa1000379e0b113efe1e2466c2')
sha256sums_x86_64=('27f7ac9bf992eb9aa7beee630c3b1882aad8678988d0baf02e2c5222cc3854dc')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
