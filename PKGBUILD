# Maintainer : Cooper <cooptheloop8 at gmail dot com>

pkgname="wretch"
pkgver="1.3.2"
pkgrel=1
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=("x86_64")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/thesillyboi/wretch/archive/refs/tags/v$pkgver.tar.gz")
url="https://github.com/thesillyboi/wretch"
makedepends=("rustup" "git")
sha512sums=('61dbaa1b17a87b9d47ccb058990b7a9480b359f05565dce51b1dd48dc81141964632f30fafa76c6a9fff55a3f1262cef5296d449e6cc5d620d62b7d7332dd08f')
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
