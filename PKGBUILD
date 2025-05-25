# Maintainer : Cooper <cooptheloop8 at gmail dot com>

pkgname="wretch"
pkgver="1.1.2"
pkgrel=1
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=("x86_64")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/thesillyboi/wretch/archive/refs/tags/v$pkgver.tar.gz")
url="https://github.com/thesillyboi/wretch"
makedepends=("rustup" "git")
sha512sums=('3d1d7f0f1cd9d72239888fda8cd44351359b158dd51acd4585e33e781f67af9299bd791885f4db510c107fdd30bd6d7bd3b0bd8e010568250d3526c16abc1c2f')
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
