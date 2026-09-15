# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/hornero>
# Native horneroctl binary from GitHub Releases (canonical distribution,
# same pattern as agent-toolkit-bin). pkgver + per-arch sha256sums are
# patched at publish time by .github/workflows/release.yml; the zero
# placeholders below fail fast if this template is built directly.
pkgname=horneroctl-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='HorneroOS system CLI (native binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/HorneroOS/hornero'
license=('MIT')
options=('!strip')
source_x86_64=("horneroctl::https://github.com/HorneroOS/hornero/releases/download/horneroctl-v${pkgver}/horneroctl-linux-x86_64")
source_aarch64=("horneroctl::https://github.com/HorneroOS/hornero/releases/download/horneroctl-v${pkgver}/horneroctl-linux-arm64")
sha256sums_x86_64=('a986e67c58a102d22598ba8d31c6dedbfd50d6f158e89a867478ce8fd0c84ef5')
sha256sums_aarch64=('80e3f1111cd54ace790131b62c391efcadf0e938c5e8de7bdddeb1851d9cc710')

package() {
  install -Dm755 "${srcdir}/horneroctl" "${pkgdir}/usr/bin/horneroctl"
}
