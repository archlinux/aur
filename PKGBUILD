# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=parity-bitcoin-git
pkgver=r1232.37372cdd
pkgrel=1
pkgdesc='The Parity Bitcoin client'
arch=('i686' 'x86_64')
url='https://parity.io/'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("git+https://github.com/paritytech/parity-bitcoin.git")
sha256sums=('SKIP')

pkgver() {
    cd parity-bitcoin

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd parity-bitcoin

    cargo build --release
}

package() {
    cd parity-bitcoin

    install -Dm755 -t "${pkgdir}/usr/bin" target/release/pbtc
}
