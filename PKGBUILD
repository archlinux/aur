# Maintainer: Zack <zack@internetuniverse.org>
pkgname=llmx-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Local-first codebase indexer with semantic search for LLM agents"
arch=('x86_64' 'aarch64')
url="https://github.com/johnzfitch/llmx"
license=('MIT')
provides=('llmx' 'llmx-mcp')
conflicts=('llmx')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/johnzfitch/llmx/releases/download/v${pkgver}/llmx-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/johnzfitch/llmx/releases/download/v${pkgver}/llmx-v${pkgver}-linux-aarch64.tar.gz")

sha256sums_x86_64=('1ef5db475811075215d81c1d2b483be37f9c179373e39d14b6a87120290a96a3')
sha256sums_aarch64=('354aac1264ffcdbe3145fac268ed074d11046da849bd580ae15f75111e8d22e0')

package() {
    cd "${srcdir}/llmx-v${pkgver}-linux-${CARCH}"
    install -Dm755 llmx "${pkgdir}/usr/bin/llmx"
    install -Dm755 llmx-mcp "${pkgdir}/usr/bin/llmx-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
