# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin-git
pkgver=r1797.8a76b374
pkgrel=1
pkgdesc='Minimal implementation of the MimbleWimble protocol'
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin'
license=('Apache')
depends=('ncurses')
makedepends=('clang' 'git' 'rust')
conflicts=('grin')
provides=('grin')
source=('git+https://github.com/mimblewimble/grin.git')
sha256sums=('SKIP')

pkgver() {
    cd grin

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd grin

    cargo build --release
}

package() {
    cd grin

    install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin
}
