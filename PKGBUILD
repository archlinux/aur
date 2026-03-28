# Maintainer: Zack <zack@internetuniverse.org>
pkgname=llmx-bin
pkgver=2.2.1
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

sha256sums_x86_64=('b2a6c0b5e454dda2113441363a6934fc5640c2cbc7559926493f70dc1f9642d0')
sha256sums_aarch64=('e4609626ab98462cdbac1f66852c80cbacb865e0f7dbc02c40485091ed3e2b01')

package() {
    cd "${srcdir}/llmx-v${pkgver}-linux-${CARCH}"
    install -Dm755 llmx "${pkgdir}/usr/bin/llmx"
    install -Dm755 llmx-mcp "${pkgdir}/usr/bin/llmx-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
