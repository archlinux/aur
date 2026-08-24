# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
pkgname=weave-bin
pkgver=0.5.2
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
            '468bbe749d6c53d333072f5135ff5a4ca72541eb1de92c6a2e0da3df362785cf'
            '82877d2ca9b1890559173a4594b9c67183f550294b9ded97ce5def45d2716dc5'
            '1c892145e1b5daab30482374b7690f7754e11bd4bc636c99df23c214a9bc443c')
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
