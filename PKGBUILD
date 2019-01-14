# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin
pkgver=0.5.2
_commit=60d3ee3c441af7036994a2a7bba8e47285ae70b0
pkgrel=1
pkgdesc='Minimal implementation of the MimbleWimble protocol'
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin'
license=('Apache')
depends=('ncurses')
makedepends=('clang' 'git' 'rust')
source=("git+https://github.com/mimblewimble/grin.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}

    cargo build --release
}

package() {
    cd ${pkgname}

    install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin
}

