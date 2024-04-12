# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.8.0
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/v$pkgver.tar.gz")
b2sums=('1660df79438942e03f47c9344df9b08bd5207518e1ffd3e0967a7d7db5ff8e796b555372b19f76b0b37d06cddef7d4eea45c0ce472acb9bb8c381acb1f1be1b4')
options=(!lto)

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
