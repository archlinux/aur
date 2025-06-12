# Maintainer : Cooper <cooptheloop8 at gmail dot com>

pkgname="wretch"
pkgver="1.3.1"
pkgrel=1
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=("x86_64")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/thesillyboi/wretch/archive/refs/tags/v$pkgver.tar.gz")
url="https://github.com/thesillyboi/wretch"
makedepends=("rustup" "git")
sha512sums=('c0d42bb1b20b37a9eb2937c609c0505cdc50da9996a7af892fe88c4d1878de466ba296a85968445ba4ea92fc89da5c3579fd8248e75f3ec9ced6bde4bef0768f')
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
