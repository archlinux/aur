# Maintainer : August <cooptheloop8 at gmail dot com>

pkgname="wretch"
pkgver="1.4.1"
pkgrel=1
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=("x86_64")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/addy10s/wretch/archive/refs/tags/v$pkgver.tar.gz")
url="https://github.com/addy10s/wretch"
makedepends=("rustup" "git")
packagedepends=("gcc-libs" "glibc")
sha512sums=('1cd0d6430df602ee3860ac967ec89fd7f8dce3bc1f51b2e07196c048618f9ff60564d4e6d7bfeb493d8fc938fe350c46ce0cf51bc7908207ee45e90fe5624574')
license=("GPL-3.0-or-later")
build() {
    cd "${srcdir}/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "${srcdir}/$pkgname-$pkgver"

    install -Dm755 target/release/wretch "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
