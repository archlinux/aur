# Maintainer: Zack <zack@internetuniverse.org>
pkgname=llmx-bin
pkgver=2.2.0
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

sha256sums_x86_64=('3cfcf0e7abc9a84f6467e93127b2ea57ac56a98014759c4fa8f217058a92faf6')
sha256sums_aarch64=('fcb5e33e45cf360295060c3df53a804ea4b4aed2cca70e71d6fd7328ce718096')

package() {
    cd "${srcdir}/llmx-v${pkgver}-linux-${CARCH}"
    install -Dm755 llmx "${pkgdir}/usr/bin/llmx"
    install -Dm755 llmx-mcp "${pkgdir}/usr/bin/llmx-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
