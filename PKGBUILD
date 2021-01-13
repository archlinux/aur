# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet
pkgver=5.0.2
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
makedepends=('clang' 'git' 'rust')
source=("$pkgname::git+https://github.com/mimblewimble/grin-wallet.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}
    cargo build --release
}

package() {
    cd ${pkgname}
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin-wallet
}
