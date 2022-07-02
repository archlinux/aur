# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/v$pkgver.tar.gz")
b2sums=('5cc29cfc6aab8222fda368b8b921e5f57299c26d678c0b5014372ecc7d93a4e09b3ee4412bd78591a177bab47c2e2c15714abc0316c2b8098fa76afb80f7aca2')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
