# Maintainer: dpi0 <dpi0.dev@proton.me>

pkgname=tree-sitter-cli-github-bin
_pkgname=tree-sitter
pkgver=0.26.5
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
sha256sums_x86_64=('d38d9a22ef398489e1eb291b2dea41467487020fe8280c2311dbbad9ba663a34')
sha256sums_aarch64=('519e8648004a725a3bb566bdb3f3134946df4c9d7fcda6be5cf67d237d2b0921')
sha256sums_armv7h=('640ab413e8a2d414ed74dbb57353bfb985d6bd859dbfef9e1a755c829b411b91')
sha256sums_i686=('8b97c3e2b763d993a87ae583f5e0c4dec8f27a3f998a82ea818eab2ce527cbb3')

package() {
  local _bin="${pkgname}-${pkgver}-${CARCH}"

  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/tree-sitter"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
