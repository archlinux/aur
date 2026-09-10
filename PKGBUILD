# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=nostromo-bin
pkgver=0.13.0
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
sha256sums_aarch64=('87853a422638c0f28c3a76418612ae518c1d39ba7b0f4a9aa6dfe53acacc7abd')
sha256sums_i686=('8aede838a72305f94f0764eb690dc4654cdb8bd4816bbe759085a8637855cffe')
sha256sums_x86_64=('3025dd80dda6b9475e333ce4447326cf1066ae4340a3876f05ac9880b4a1f2f4')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
