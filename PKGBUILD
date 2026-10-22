# Maintainer: czyt <czytcn@gmail.com>
pkgname=xerj-bin
pkgver=1.0.0rc.98
pkgrel=2
pkgdesc="Local-first search engine and MCP server for AI agents: BM25, vector and hybrid search over code, docs, logs and PDFs"
arch=('x86_64' 'aarch64')
url="https://xerj.org"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=('xerj')
conflicts=('xerj')
options=('!strip' '!debug')
# Upstream releases carry tags like v1.0.0-rc.98; the hyphen is not allowed in
# pkgver, so it is replaced with a dot and the original tag is kept separately.
_tagver="1.0.0-rc.98"
_arc_x86_64="x86_64"
_arc_aarch64="aarch64"
source_x86_64=("xerj-${_tagver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/xerj-org/xerj/releases/download/v${_tagver}/xerj-${_tagver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("xerj-${_tagver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/xerj-org/xerj/releases/download/v${_tagver}/xerj-${_tagver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cd983afbea1d8a54c8762950f064a1d47ba9a06027aa9f8d8c295c803e565ff2')
sha256sums_aarch64=('5bcb82bdc2f92075b6712081ec973a9a317c35411f1e58712f9fefb098c2d04b')

package() {
    local _arc_var="_arc_${CARCH}"
    local _arc="${!_arc_var}"
    local _dir="xerj-${_tagver}-${_arc}-unknown-linux-gnu"

    install -Dm755 "${srcdir}/${_dir}/xerj" "${pkgdir}/usr/bin/xerj"
    install -Dm644 "${srcdir}/${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
