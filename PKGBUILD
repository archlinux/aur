# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-lsp-bin
pkgver=0.24.6
pkgrel=1
pkgdesc="MCP server that orchestrates language servers for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/blackwell-systems/agent-lsp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/blackwell-systems/agent-lsp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agent-lsp_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agent-lsp_linux_arm64.tar.gz")
sha256sums=('a0a5e156f85c30d7b1dbf2427dc376b2bc84052d5aa3e95e6d6b0e7f42cf379a')
sha256sums_x86_64=('9e967d73c49f85edaeb6daccf31741b08cf95c0a6522d2914255eb56a8741103')
sha256sums_aarch64=('7dc155b90237acb2a7457feb5aec90af8338085442e3d5a9ebc5d4becc0ba970')

package() {
  install -Dm755 "agent-lsp" "${pkgdir}/usr/bin/agent-lsp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
