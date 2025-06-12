# Maintainer : Cooper <cooptheloop8 at gmail dot com>

pkgname="wretch"
pkgver="1.3.0"
pkgrel=1
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=("x86_64")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/thesillyboi/wretch/archive/refs/tags/v$pkgver.tar.gz")
url="https://github.com/thesillyboi/wretch"
makedepends=("rustup" "git")
sha512sums=('7a5bdd9e8089dbcff817b12401d6d28af0fb0ce83e93e8f77a737f60bf85fa8b946ce7d5be360f7a20cf6513ecbfbb104a9ff63212fd90808f44f3a275214897')
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
