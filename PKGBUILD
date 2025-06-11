# Maintainer: L4z3x <moussaousselmal1970@gmail.com>
pkgname=mal-cli
pkgver=0.2.1
pkgrel=1
pkgdesc="A powerful CLI tool for MyAnimeList"
arch=('x86_64')
url="https://github.com/L4z3x/mal-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/L4z3x/mal-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f13224932cd3098c84288e27a0b18e201ba633fd78daf1ba59524672d1867f07')
options=('!lto')
build() {
    cd "${srcdir}/mal-cli-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/mal-cli-${pkgver}"
    install -Dm755 "target/release/mal" "${pkgdir}/usr/bin/mal"
}
