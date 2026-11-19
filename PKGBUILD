# Maintainer: Rafael Just <rafaeljust at proton dot me>
pkgname="powerlevel11k"
pkgver="1.0.0_alpha.1"
pkgdesc="Powerlevel10k continuation for all shells"
pkgrel=3
arch=("x86_64")
conflicts=('powerlevel11k-git')
url="https://github.com/Qaaxaap/powerlevel11k"
license=("GPL-3.0-or-later")
depends=('libssh2' 'libgit2')
makedepends=('rust' 'cmake' 'gettext' 'pkg-config')
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/Qaaxaap/powerlevel11k/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('2730195bf556dd766fe8171b640261d255cf40327dc6f647ece008e61b77b6e3')
options=(!lto)

build () {
    cd "$srcdir/${pkgname}-${pkgver//_/-}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-${pkgver//_/-}"
    install -Dm755 target/release/p11k "${pkgdir}/usr/bin/p11k"
}
