# Maintainer: Kepler Team <info at kepler.mw>

pkgname=kepler-wallet-git
pkgver=r179.1f298ce
pkgrel=1
pkgdesc='Kepler Wallet'
arch=('x86_64')
url='https://github.com/keplernetwork/kepler-wallet'
license=('Apache')
depends=('ncurses')
makedepends=('clang' 'git' 'rust')
conflicts=('kepler-wallet')
provides=('kepler-wallet')
source=('git+https://github.com/keplernetwork/kepler-wallet.git')
sha256sums=('SKIP')

pkgver() {
    cd kepler-wallet

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd kepler-wallet

    cargo build --release
}

package() {
    cd kepler-wallet

    install -Dm755 -t "${pkgdir}/usr/bin" target/release/kepler-wallet
}
