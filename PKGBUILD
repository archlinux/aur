# Maintainer : Cooper <cooptheloop8 at gmail dot com>

pkgname="wretch"
pkgver="1.0.0"
pkgrel=1
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=("x86_64")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/thesillyboi/wretch/archive/refs/tags/v$pkgver.tar.gz")
url="https://github.com/thesillyboi/wretch"
makedepends=("rustup" "git")
sha512sums=('27770679f7cfd9438e8dc2af2764df3c8905522c5d62b935e5a90905c5ac406230c5faa9ee618957fa5b33f07632d9f95d3865259e3b66977b42cafcb97cdbf0')
license=("GPL3")
build() {
    cd "${srcdir}/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "${srcdir}/$pkgname-$pkgver"
    mkdir -p "${pkgdir}/usr/bin"
    cp target/release/wretch "${pkgdir}/usr/bin/"
    chmod +x "${pkgdir}/usr/bin/wretch"
}
