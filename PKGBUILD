# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.42.0
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4fe8e99788b0c9426da4e6056793cdc491ec0a9e7385b7afa6e89e23a0e7ae13')
sha256sums_aarch64=('0a4518c6692d902dc99aced4382861963a265ef53e5fd6e462d09c4d64574218')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-MIT" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-MIT"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-APACHE"
}
