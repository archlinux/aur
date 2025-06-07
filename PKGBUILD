# Maintainer: L4z3x <moussaousselmal1970@gmail.com>
pkgname=mal-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="A powerful CLI tool for MyAnimeList"
arch=('x86_64')
url="https://github.com/L4z3x/mal-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/L4z3x/mal-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1a2f656152efe8af8daca14d404d3481d24ca6a633e3ad000d1cad8ad610c86')

build() {
    cd "${srcdir}/mal-tui-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/mal-tui-${pkgver}"
    install -Dm755 "target/release/mal" "${pkgdir}/usr/bin/mal"
}
