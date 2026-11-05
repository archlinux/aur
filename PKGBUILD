# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=agent-desktop
pkgname=agent-desktop-bin
pkgver=1.2.0
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
sha256sums_x86_64=('591ae7f4a38479dc045df97e27447c0c8b530441730ab6b990e27c813162af44')
sha256sums_aarch64=('68e8ebbb4f80e44485d2f1cf972943a38ee43108e2e0ce56bdfa641fd1599f68')

package() {
  # agent-desktop looks for its helper next to its own executable
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-linux-clipboard-owner" "${pkgdir}/usr/bin/${_pkgname}-linux-clipboard-owner"
  install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
