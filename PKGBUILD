# Maintainer: agony <27015 at riseup dot net>

pkgname=rbitcoin-bin
pkgver=0.9.2
pkgrel=1
pkgdesc='Bitcoin full node with a relational archive, pure-Rust consensus and Electrum (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/rbitcoin-org/rbitcoin'
license=('MIT OR Apache-2.0')
provides=("rbitcoin=${pkgver}")
conflicts=('rbitcoin')
_release="${url}/releases/download/v${pkgver}"
source=("rbitcoin-${pkgver}-LICENSE-MIT::https://raw.githubusercontent.com/rbitcoin-org/rbitcoin/v${pkgver}/LICENSE-MIT")
source_x86_64=("rbitcoin-node-${pkgver}-x86_64::${_release}/rbitcoin-node-x86_64-linux"
               "rbitcoin-cli-${pkgver}-x86_64::${_release}/rbitcoin-cli-x86_64-linux")
source_aarch64=("rbitcoin-node-${pkgver}-aarch64::${_release}/rbitcoin-node-aarch64-linux"
                "rbitcoin-cli-${pkgver}-aarch64::${_release}/rbitcoin-cli-aarch64-linux")
sha256sums=('5271ec10e88487a5637dd41fd3d18dd4969eec4f90f77fd44169772bdcfa6215')
sha256sums_x86_64=('4d1ccd59a15f30807a895bc1924e8b5706dac4566588c8c69f7b7dce361ef409'
                   '0d0fba5ebaf4e688d5ace48a77afa223822dcfd8818709cb827151c5ca1ad9d6')
sha256sums_aarch64=('1cb35314b0d2066b5949cc3ca4aea5c0e0ca8484301ca0b465ee81b12ff679c3'
                    'f7b11a682b25fcd506b54ef270e92c671a87789cf2f41b1720a110a82ec6f84b')

package() {
  install -Dm755 "rbitcoin-node-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/rbitcoin-node"
  install -Dm755 "rbitcoin-cli-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/rbitcoin-cli"
  install -Dm644 "rbitcoin-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
