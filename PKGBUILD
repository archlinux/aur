# Maintainer: cauebs <cauebs@pm.me>

pkgname="hyperfine-bin"
pkgdesc="A command-line benchmarking tool - Precompiled binary from official repository"
url="https://github.com/sharkdp/hyperfine"
license=("APACHE" "MIT")

pkgver=1.6.0
pkgrel=1

provides=('hyperfine')
conflicts=('hyperfine')
arch=('x86_64' 'i686')

source_x86_64=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4851b0da5d13803c6e8c3589487af2a5d128dbe8075d017bad7abae3ae0c16c0')

source_i686=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_i686=('ff75ad8cdb16c259ae5b8b95c619524ae546a37e3398f3e2a2abbadf5489f013')

package() {
    cd "${srcdir}/${pkgname/-bin}-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm 644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-APACHE"
    install -Dm 644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-MIT"
    install -Dm 755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
