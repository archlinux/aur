# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Achilleas Pipinellis <axilleas at archlinux dot gr>
pkgname=vale-bin
pkgver=3.4.2
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
sha256sums_aarch64=('9e233fca7f34ff7e5a4cb46a71101053b2ebc16d27cefb21d8dcb14922da4cce')
sha256sums_i686=('b4a9941b6a697a0bfa8c9561d8dfe180dab3a6a9fddac9ab40e1dfd1d98da7a2')
sha256sums_x86_64=('f5b12b495cf6582c49703eca8021b480bb77b6f6999e18a1d311254ef58a2ff8')

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}