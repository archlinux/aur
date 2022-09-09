# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.1.1
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/v$pkgver.tar.gz")
b2sums=('e284af4919b6376070b46b788f2f98b9074e4b45955df5a0eca1a390747809b96151057fc19559831d81020984471173b3344926030abcf88ffc9f44e73696f8')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
