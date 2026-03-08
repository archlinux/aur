# Maintainer: Daniel Smith <hello@grabchars.org>
pkgname=grabchars
pkgver=2.1.0
pkgrel=1
pkgdesc="Get keystrokes directly from user - interactive terminal input for shell scripts"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/DanielSmith/grabchars"
license=('Apache-2.0')
provides=('grabchars')
conflicts=('grabchars-bin')
makedepends=('cargo')

source=("https://static.crates.io/crates/grabchars/grabchars-${pkgver}.crate")
sha256sums=('6a0a52ca6aaab415d55e8fc896cc71c71a881858ff119c1f920e4ae12e7ad4b3')

build() {
    cd "grabchars-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "grabchars-${pkgver}"
    install -Dm755 target/release/grabchars "${pkgdir}/usr/bin/grabchars"
}
