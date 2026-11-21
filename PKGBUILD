# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.27.0
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('55a012f0887b03b6424e8e85d26e92a4bd7a7ec06cd685c7378a8f83c038d774')
sha256sums_aarch64=('3c9677d2a5f810dc7ffa86912728d64ffc8480fa809688c3fc8e643ea322d16a')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-MIT" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-MIT"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-APACHE"
}
