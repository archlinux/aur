# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=ship162-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Decode and demodulate AIS data in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/ship162"
license=('MIT')
provides=('ship162')
conflicts=('ship162')

source_x86_64=("ship162-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/ship162-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("ship162-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/ship162-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('2aabe982a58d387b25c8a49edbeaee6a53d79a9178967c84618c98127dde7a8f')
sha256sums_aarch64=('48d62c7912d4116af9606d01150d875e5b5b6d9d710dfe42a9947e011b3b7bcb')

package() {
    cd "ship162-${CARCH}-unknown-linux-gnu"
    install -Dm755 "ship162" "${pkgdir}/usr/bin/ship162"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/ship162/readme.md"
}
