# Maintainer: Zack <zack@internetuniverse.org>
pkgname=llmx-bin
pkgver=2.1.1
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

sha256sums_x86_64=('c61718a965ea8f1dd9cbea34263738dbcfc462a212c44e0c74ac5bcec33cddda')
sha256sums_aarch64=('0c716c9f1ccf99be32ff99a4816ad87c881c5b07015601c95058cde2bd85d60b')

package() {
    cd "${srcdir}/llmx-v${pkgver}-linux-${CARCH}"
    install -Dm755 llmx "${pkgdir}/usr/bin/llmx"
    install -Dm755 llmx-mcp "${pkgdir}/usr/bin/llmx-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
