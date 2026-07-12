# Maintainer: lee <charlselee58@gmail.com>
#
# Rendered by .github/workflows/release.yml — 0.1.1 / @SHA256_*@ are
# substituted with the tag and the checksums of the published release tarballs.

pkgname=d9cker-bin
_pkgname=d9cker
pkgver=0.1.1
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
sha256sums_x86_64=('b9ad25e1d304dca9e922e6b21ba6e5f39b2fb603f0fa02a9c027dd327f8de1ac')
sha256sums_aarch64=('23eb24ac0ba94d4f7bc2fd5df5f9911161eb48a518d9b4ad8d8486c9c2bfb78f')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
