# Maintainer: Co-Prime Bageler <cloakoverseerb@gmail.com>

pkgname=ftuibos
pkgver=1.0.0
pkgrel=1
pkgdesc="The first fully TUI based operating system."
arch=('any')
url="https://github.com/averagebagelenjoyer/2BOS"
license=('MIT')
depends=()

source=("git+$url")
sha256sums=('SKIP') # TEMPORARY CHECKSUM FOR TESTING

makedepends=('rust' 'cargo')

pkgver() {
    cd "$srcdir/2BOS"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/2BOS"
    cargo build --release # --locked
}

package() {
    cd "${srcdir}/2BOS"
    install -Dm755 "target/release/ftuibos" "${pkgdir}/usr/bin/ftuibos"
}
