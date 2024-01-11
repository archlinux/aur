# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.6.0
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/v$pkgver.tar.gz")
b2sums=('103695c8b5cfc0a757457b69a01c337f01ae1af195dd284c449cd7904cb204ad237792d38be539b1d4aea9776374e32258e76ceed979110c0af114ec7478e26b')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
