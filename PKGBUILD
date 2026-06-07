# Maintainer: Koutheir Attouchi <koutheir@gmail.com>
pkgname=weave-bin
pkgver=0.3.6
pkgrel=1
pkgdesc='Entity-level semantic merge driver for Git. Resolves merge conflicts that Git cannot by understanding code structure via tree-sitter'
url="https://github.com/Ataraxy-Labs/weave/tree/v${pkgver}"
license=('Apache-2.0' 'MIT')
arch=('x86_64')
depends=('glibc' 'libgcc')
makedepends=()
checkdepends=()
optdepends=()
conflicts=('weave-merge')
backup=()
options=(!debug !strip)
install=
source=(
    "https://github.com/Ataraxy-Labs/weave/raw/refs/tags/v${pkgver}/LICENSE-APACHE"
    "https://github.com/Ataraxy-Labs/weave/raw/refs/tags/v${pkgver}/LICENSE-MIT"
    "https://github.com/Ataraxy-Labs/weave/releases/download/v${pkgver}/weave-cli-${CARCH}-unknown-linux-gnu.tar.gz"
    "https://github.com/Ataraxy-Labs/weave/releases/download/v${pkgver}/weave-driver-${CARCH}-unknown-linux-gnu.tar.gz"
    "https://github.com/Ataraxy-Labs/weave/releases/download/v${pkgver}/weave-mcp-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('3d5ac2ca3c9e4bcd641e43c5512350cf62e15e527f9b4a720d52b546d9965a5f'
            '0173d0fc0ea38a5124e9cc7eea9db01a14141ce1240508eb497f701394fe49eb'
            '372d7de3166d3ce27e51318c12f573433a0c863093872c2ff2acf42f8a247f82'
            'b636c38d43a27376ddf39c4e48daa427be1f855bccbdafc444963e7540206773'
            '5013c6d30d83a6e1099d32928f1e762a34128e7652d4add525fe26c1eb0bf77e')
validpgpkeys=()

prepare() {
    true
}

build() {
    true
}

check() {
    true
}

package () {
    mkdir -p "${pkgdir}/usr"/{bin,share/licenses/${pkgname}}

    install -D --preserve-timestamps --mode=644 \
        "--target-directory=${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE-"{APACHE,MIT}
    install -D --preserve-timestamps --mode=755 \
        "--target-directory=${pkgdir}/usr/bin" "${srcdir}/"{weave-driver,weave-mcp}
    install -D --preserve-timestamps --mode=755 "${srcdir}/weave" "${pkgdir}/usr/bin/weave-cli"
}
