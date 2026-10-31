# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=agent-desktop
pkgname=agent-desktop-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Desktop computer use for AI agents through OS accessibility trees (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel-labs/agent-desktop"
license=('Apache-2.0')
depends=('libgcc' 'glibc' 'at-spi2-core')
optdepends=('wl-clipboard: clipboard support on Wayland')
provides=('agent-desktop')
conflicts=('agent-desktop' 'agent-desktop-git')
source=("LICENSE-v${pkgver}::https://raw.githubusercontent.com/vercel-labs/${_pkgname}/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('ad661b7a3fd8f990a769243f4889a240ca0e2c8dab3ef5bddd6019086c71e0b4')
sha256sums_aarch64=('864cb782e0afc8bf0df19622016b24bdbd1a83fc7749f784ee82aa49a7f845eb')

package() {
  # agent-desktop looks for its helper next to its own executable
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-linux-clipboard-owner" "${pkgdir}/usr/bin/${_pkgname}-linux-clipboard-owner"
  install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
