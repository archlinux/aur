# Maintainer: Zaid Ajo <zaidejjodev@gmail.com>
# Template — replace zaidejjo and sha256sums before publishing.

pkgname=omniapi-cli-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="OmniAPI CLI — blazing-fast API client for CI/CD (standalone binary)"
arch=('x86_64')
url="https://github.com/zaidejjo/omniapi"
license=('MIT')
depends=()

# Standalone binary compiled with bun build --compile (no runtime deps)
source=(
  "${url}/releases/download/v${pkgver}/oma-linux-x64"
  "https://raw.githubusercontent.com/zaidejjo/omniapi/v${pkgver}/README.md"
  "https://raw.githubusercontent.com/zaidejjo/omniapi/v${pkgver}/LICENSE"
)
sha256sums=('285e4efc4f3d267e2d55bef0ca3017959e951ad10c3d4fb6caebae4c8806e738')

package() {
  install -d "${pkgdir}/usr/bin"

  # Binary
  install -Dm755 "${srcdir}/oma-linux-x64" "${pkgdir}/usr/bin/oma"

  # Docs
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
