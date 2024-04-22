# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=nostromo-bin
pkgver=0.12.0
pkgrel=2
pkgdesc="CLI for building powerful aliases"
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
sha256sums_aarch64=('d77b7b9f3b553f5be0ac148f0cef70044c9602ccfbee4125b57fa53a1d6bdd9f')
sha256sums_i686=('6de88e86b28c3c1684376a911a2d2e8b2d35491f5a9cbcd89ee6946ff956768a')
sha256sums_x86_64=('3ebb212029c1694480c1059e07db77d378e715de47ee8c1e0b6f2905be765955')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}