# Maintainer: Daniel Smith <hello@grabchars.org>
pkgname=grabchars
pkgver=2.0.1
pkgrel=1
pkgdesc="Get keystrokes directly from user - interactive terminal input for shell scripts"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/DanielSmith/grabchars"
license=('Apache-2.0')
provides=('grabchars')
conflicts=('grabchars-bin')
makedepends=('cargo')

source=("https://static.crates.io/crates/grabchars/grabchars-${pkgver}.crate")
sha256sums=('a56b56e9d50371a74004ad5bc98f79f67ee66ffec695975de0fe4673a1f92fce')

build() {
    cd "grabchars-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "grabchars-${pkgver}"
    install -Dm755 target/release/grabchars "${pkgdir}/usr/bin/grabchars"
}
