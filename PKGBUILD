# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.41.0
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e63cb8d8d8135d9a76d5e1a9d5a94fd11ea47425cfc046830928554bf0072a6a')
sha256sums_aarch64=('dabf9eb72e0c630f3ccd35153b23260403a79dfda5896bb41f81eba2d0a093a3')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-MIT" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-MIT"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-APACHE"
}
