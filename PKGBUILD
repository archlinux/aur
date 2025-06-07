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
sha256sums=('25c3fdbce082e714244fb2267c502f2c2ae0ce7683e31c1c0e20ae06d2842625')

build() {
    cd "${srcdir}/mal-cli-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/mal-cli-${pkgver}"
    install -Dm755 "target/release/mal" "${pkgdir}/usr/bin/mal"
}
