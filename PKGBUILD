# Maintainer: L4z3x <moussaousselmal1970@gmail.com>
pkgname=mal-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="A powerful CLI tool for MyAnimeList"
arch=('x86_64')
url="https://github.com/L4z3x/mal-tui"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/L4z3x/mal-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('77660a984fd735cf1313f709807dee613da732407354341b104ccae2ce89e43f')

build() {
    cd "${srcdir}/mal-cli-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${srcdir}/mal-cli-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/mal-cli-${pkgver}"
    install -Dm755 "target/release/mal" "${pkgdir}/usr/bin/mal"
}
