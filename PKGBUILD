# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=bk-bin
pkgver=0.43.0
pkgrel=1
pkgdesc="Double-entry accounting on the command line — SQLCipher-encrypted, multi-tenant"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/beankeeper"
license=('MIT' 'Apache-2.0')
provides=('bk')
conflicts=('bk')

source_x86_64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/beankeeper-cli-v${pkgver}/bk-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9bc529e95de4d4a6c63cbfffa2c1724e2f408a85a1e42d72d67ae7e1c72c67ac')
sha256sums_aarch64=('ea4b7e0be582f51e2ebcc5f34067fa826805ef9d8302e1052fb10d52e9cb207e')

package() {
    install -Dm755 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/bk" "${pkgdir}/usr/bin/bk"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-MIT" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-MIT"
    install -Dm644 "bk-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/bk-bin/LICENSE-APACHE"
}
