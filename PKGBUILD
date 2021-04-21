# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=0.41.0
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('git' 'rust')
source=("$pkgname::git+https://github.com/nervosnetwork/ckb-cli#tag=v${pkgver}")
b2sums=('SKIP')

build() {
    cd ${pkgname}
    cargo build --release
}

package() {
    cd ${pkgname}
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
