# Maintainer: James Houghton <jamesthoughton@gmail.com>

pkgname=hypershare-git
_pkgname=hypershare
pkgver=0.2.1
pkgdesc="Small, interactive HTTP server with a TUI."
pkgrel=1
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('cargo' 'git')
source=("git+https://github.com/48ca/hypershare")
url=https://github.com/48ca/hypershare
sha256sums=("SKIP")

pkgver() {
    cd "${_pkgname}"
    git rev-parse --short HEAD
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${_pkgname}"
    install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
