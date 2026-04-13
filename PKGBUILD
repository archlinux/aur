# Maintainer: dpi0 <dpi0.dev@proton.me>

pkgname=tree-sitter-cli-github-bin
_pkgname=tree-sitter
pkgver=0.26.8
pkgrel=1
pkgdesc="An incremental parsing system for programming tools"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/tree-sitter/tree-sitter"
license=('MIT')
depends=('gcc-libs')
optdepends=('nodejs: for the generate subcommand')
provides=("tree-sitter-cli=${pkgver}")
conflicts=('tree-sitter-cli')
options=(!debug)

_url="https://github.com/tree-sitter/tree-sitter/releases/download/v${pkgver}/tree-sitter-linux"

source_x86_64=("${pkgname}-${pkgver}-x86_64.gz::${_url}-x64.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.gz::${_url}-arm64.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.gz::${_url}-arm.gz")
source_i686=("${pkgname}-${pkgver}-i686.gz::${_url}-x86.gz")

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/tree-sitter/tree-sitter/v${pkgver}/LICENSE")

sha256sums=('c5cfb43042b6b72045f4ba997834d0a7786d2793d91680868b5815b39f14fc78')
sha256sums_x86_64=('9754a32800f0b970152782df177b4a47c711e34e651a7aceb384d8bd29fa136e')
sha256sums_aarch64=('e339d6533b20830dd1666fe320aff85d301b3f59964a3836870b77f4827f9a17')
sha256sums_armv7h=('a33544fdc074a590b7f24ec7e1d93a3f1d2b36ef8db2c4f842bd68b9637f2e95')
sha256sums_i686=('be598dac017c57475fb16919f4ea6357f185af0e6f8872eea5d1da5e6c3d313b')

package() {
  local _bin="${pkgname}-${pkgver}-${CARCH}"

  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/tree-sitter"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
