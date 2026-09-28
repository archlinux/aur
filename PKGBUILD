# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=nostromo-bin
pkgver=0.14.0
pkgrel=1
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
sha256sums_aarch64=('c0bcae34e13b0c333f6d86f9269602a5d0412a8f78bfd5d24026206d9a030a2a')
sha256sums_i686=('b8d69b0ea1141f595604edc3d278c70e80850f7ebd732fa464735dd0acd8cd7b')
sha256sums_x86_64=('f4c3861382060eba2af5535193987e7846d6f711416c0ff5c74690bfceb2f36d')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
