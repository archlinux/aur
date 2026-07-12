# Maintainer: lee <charlselee58@gmail.com>
#
# Rendered by .github/workflows/release.yml — 0.1.0 / @SHA256_*@ are
# substituted with the tag and the checksums of the published release tarballs.

pkgname=d9cker-bin
_pkgname=d9cker
pkgver=0.1.0
pkgrel=1
pkgdesc="A k9s-style terminal UI for Docker & Docker Swarm"
arch=('x86_64' 'aarch64')
url="https://github.com/loyalpartner/d9cker"
license=('MIT')
depends=('gcc-libs' 'openssh')
optdepends=('docker: manage a local engine')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5b60b4decd8c5104cdaeec0d9ccff45ee26c498f86a37c384dac37a9beb3fe9e')
sha256sums_aarch64=('b83e2f3b750fbfe3d5fd979f3472f89aa9eeb094fb495949e32ef5b46a9ebd6d')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
