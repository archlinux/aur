# Maintainer: Nynke Lindeman <nynkelindeman@proton.me>

pkgname=bonk-cli-bin
pkgver=0.1
pkgrel=1
pkgdesc="The blazingly fast touch alternative with a sprinkle of mkdir written in rust."
arch=('x86_64')
url="https://github.com/elliot40404/bonk"
license=('MIT')
depends=('cargo')
makedepends=('rust')

source=("git+https://github.com/elliot40404/bonk.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/bonk"
    cargo build --release --locked
}

package() {
    cd "$srcdir/bonk"
    install -Dm755 "target/release/bonk" "$pkgdir/usr/bin/bonk"
}
