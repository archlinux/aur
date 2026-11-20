# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b0d3cae3a754c58e8c6e20c1a635c9dfe50c959670019940e3ac21433e107f08')
sha256sums_aarch64=('99564d0b252950294b84e406d257e7df6472d82674cc04dcdb41f95d3d7c021a')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-MIT" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-MIT"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-APACHE"
}
