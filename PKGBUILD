# Maintainer: czyt <czytcn@gmail.com>
pkgname=xerj-bin
pkgver=1.0.0rc.101
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
_tagver="1.0.0-rc.101"
_arc_x86_64="x86_64"
_arc_aarch64="aarch64"
source_x86_64=("xerj-${_tagver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/xerj-org/xerj/releases/download/v${_tagver}/xerj-${_tagver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("xerj-${_tagver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/xerj-org/xerj/releases/download/v${_tagver}/xerj-${_tagver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('999647a588cb113b49ec27cb72c43afa6bf367d8fb2b079b510eee703b025800')
sha256sums_aarch64=('69ffd58123ea8e54b3be8bee2143a18a8455f4f943f9da114b86f3d0fbca16bb')

package() {
    local _arc_var="_arc_${CARCH}"
    local _arc="${!_arc_var}"
    local _dir="xerj-${_tagver}-${_arc}-unknown-linux-gnu"

    install -Dm755 "${srcdir}/${_dir}/xerj" "${pkgdir}/usr/bin/xerj"
    install -Dm644 "${srcdir}/${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
