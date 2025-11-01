# Maintainer: Ahmad Othman <ahmad.ali.othman@outlook.com>
pkgname=marp-bin
pkgver=4.2.3
pkgrel=1
pkgdesc="A CLI interface for Marp and Marpit-based converters"
arch=('x86_64')
url="https://github.com/marp-team/marp-cli"
license=('MIT')
depends=()
optdepends=(
  'chromium: for exporting to PDF, PPTX, and image formats'
  'microsoft-edge-stable-bin: for exporting to PDF, PPTX, and image formats'
  'firefox: for exporting to PDF, PPTX, and image formats'
)
provides=('marp')
conflicts=('marp')
options=('!strip' '!lto')
source=("https://github.com/marp-team/marp-cli/releases/download/v${pkgver}/marp-cli-v${pkgver}-linux.tar.gz")
sha256sums=('SKIP')

package() {
  tar -xzf "marp-cli-v${pkgver}-linux.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
}
