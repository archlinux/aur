# Maintainer: L4z3x <moussaousselmal1970@gmail.com>
pkgname=mal-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="A powerful CLI tool for MyAnimeList"
arch=('x86_64')
url="https://github.com/L4z3x/mal-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/L4z3x/mal-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('76a948bf4ef5f5a521409ac9a2161ecdfff4da33ffd6d624e124e50ed4072ab8')
options=('!lto')
build() {
    cd "${srcdir}/mal-cli-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/mal-cli-${pkgver}"
    install -Dm755 "target/release/mal" "${pkgdir}/usr/bin/mal"
}
