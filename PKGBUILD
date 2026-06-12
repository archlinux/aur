# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=ship162-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Decode and demodulate AIS data in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/ship162"
license=('MIT')
provides=('ship162')
conflicts=('ship162')

source_x86_64=("ship162-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/ship162-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("ship162-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/ship162-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('40691937754c84e61fa76fef45c5468276baf1cae25dfb5b295dad0bbd22ab2c')
sha256sums_aarch64=('870ce7184848b441b4dcb08a056a3e2a22c40061bbf59e4ca158dc6b50d870d6')

package() {
    cd "ship162-${CARCH}-unknown-linux-gnu"
    install -Dm755 "ship162" "${pkgdir}/usr/bin/ship162"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/ship162/readme.md"
}
