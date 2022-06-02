# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet
pkgver=5.1.0
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
makedepends=('clang' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mimblewimble/grin-wallet/archive/v$pkgver.tar.gz")
b2sums=('b681b173b76d4d4ffbe72321ad568b533fffdcb43f590ac72b1e103c695826b6a09fe237018c5cca0ea3054cd453232c14bf784f104c18be6a878ec7b933d561')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin-wallet
}
