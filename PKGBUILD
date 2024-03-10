# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.7.0
pkgrel=1
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/v$pkgver.tar.gz")
b2sums=('57d13adfce2388d65af31b1f3ade26f9902d2c5a930f3ed1659c748e0b6c6b405aa7e74aab4caa757f4c673fd2ec9ad4b9a7f5f4a2a3231eba5ec2d045be81e2')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
