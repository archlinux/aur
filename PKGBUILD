# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Achilleas Pipinellis <axilleas at archlinux dot gr>
pkgname=vale-bin
pkgver=3.4.1
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://vale.sh/"
_ghurl="https://github.com/errata-ai/vale"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::https://github.com/errata-ai/vale/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::https://github.com/errata-ai/vale/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/errata-ai/vale/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_64-bit.tar.gz")
sha256sums_aarch64=('d8c1db6d0cf047a8e1a17539afc703924f4d65d47f4258955ed3a0efc7df93d5')
sha256sums_i686=('b5f625d29eed54c33d47991f507df7554f220099d8e9f7d3232fbfc97db82c21')
sha256sums_x86_64=('6acab380f840c5e08feeae51314a89617413d065327edced9c41c400d2965e40')

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}