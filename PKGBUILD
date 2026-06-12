# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=jet1090-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('jet1090')
conflicts=('jet1090')

source_x86_64=("jet1090-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/jet1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("jet1090-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/jet1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('457e1a9d7e80b9211b01da613103932f885f0a51365eed1e4a3903483357d9c0')
sha256sums_aarch64=('63b739cdae5f9417b1d2d8bb432c0f26695b8e71121c49b134a7020e92ef26dc')

package() {
    cd "jet1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "jet1090" "${pkgdir}/usr/bin/jet1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/jet1090/readme.md"
}
