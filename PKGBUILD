# Maintainer: Sean Mitchell <sean@mitchwood.com>
pkgname=mcp-fetch-go-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="MCP server that fetches URLs and converts HTML to Markdown for LLM coding assistants"
arch=('x86_64' 'aarch64')
url="https://github.com/arawak/mcp-fetch-go"
license=('MIT')
provides=('mcp-fetch-go' 'gofetch')
conflicts=('mcp-fetch-go' 'mcp-fetch-go-git')

source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/arawak/mcp-fetch-go/releases/download/v${pkgver}/mcp-fetch-go_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/arawak/mcp-fetch-go/releases/download/v${pkgver}/mcp-fetch-go_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('05c72986d56cbc349f6fa03e5da30310b55f8a39f128391b0c3cf3dcaa0fe1fd')
sha256sums_aarch64=('f95f86a99259db36373c12cffdb658583a1b51e3552b7d33c88a33a947f75061')

package() {
  install -Dm755 gofetch "${pkgdir}/usr/bin/gofetch"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
