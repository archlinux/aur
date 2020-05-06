# Maintainer: Kepler Team <info at kepler.mw>

pkgname=kepler-git
pkgver=r2268.d6a11656
pkgrel=1
pkgdesc='Kepler is an implementation of the MimbleWimble protocol enabling Confidential Assets'
arch=('x86_64')
url='https://github.com/keplernetwork/kepler'
license=('Apache')
depends=('ncurses')
makedepends=('clang' 'git' 'rust')
conflicts=('kepler')
provides=('kepler')
source=('git+https://github.com/keplernetwork/kepler.git')
sha256sums=('SKIP')

pkgver() {
    cd kepler

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd kepler

    cargo build --release
}

package() {
    cd kepler

    install -Dm755 -t "${pkgdir}/usr/bin" target/release/kepler
}
