# Maintainer: czyt <czytcn@gmail.com>
pkgname=xerj-bin
pkgver=1.0.0rc.105
pkgrel=1
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
_tagver="1.0.0-rc.105"
_arc_x86_64="x86_64"
_arc_aarch64="aarch64"
source_x86_64=("xerj-${_tagver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/xerj-org/xerj/releases/download/v${_tagver}/xerj-${_tagver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("xerj-${_tagver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/xerj-org/xerj/releases/download/v${_tagver}/xerj-${_tagver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1d84a2e0155825dce3ecb80b9399142ac11b492b59fa9c72fd01cf21fb6c36d8')
sha256sums_aarch64=('bd0314eccba4afdc91e71ca572f68c80f7c5d3cf9ef03e5d4cbde0fab0079c6f')

package() {
    local _arc_var="_arc_${CARCH}"
    local _arc="${!_arc_var}"
    local _dir="xerj-${_tagver}-${_arc}-unknown-linux-gnu"

    install -Dm755 "${srcdir}/${_dir}/xerj" "${pkgdir}/usr/bin/xerj"
    install -Dm644 "${srcdir}/${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
