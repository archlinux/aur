# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/v$pkgver.tar.gz")
b2sums=('afbc60cdbb874b3e3a3c04fd644776a7ad50bc370f0b30d26f7f249b1e68fe21fe84bc81dc3dd7c93731ad3da15247b969ffddcc199d0f0e3dcffd9fc7bb27e2')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
