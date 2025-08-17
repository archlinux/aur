# Maintainer: Connor Akey <connor@proton.me>
pkgname=todo-list-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple CLI todo list written in Rust"
arch=('x86_64')
url="https://github.com/connorakey/todo-list-rs"
license=('GPL')
depends=('rust')
makedepends=('cargo')
source=("https://github.com/connorakey/todo-list-rs/archive/refs/tags/v${pkgver}.zip")
sha256sums=('bcfae76b12fc82da63917d0a8165652a91275c20f56bcc04b0fa531115ea5ff0')

build() {
    cd "${srcdir}/todo-list-rs-${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/todo-list-rs-${pkgver}"
    install -Dm755 "target/release/todo_list" "${pkgdir}/usr/bin/todo"
}
