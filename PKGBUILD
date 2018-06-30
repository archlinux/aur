# Maintainer: cauebs <cauebs@pm.me>

pkgname="hyperfine-bin"
pkgdesc="A command-line benchmarking tool - Precompiled binary from official repository"
url="https://github.com/sharkdp/hyperfine"
license=("APACHE" "MIT")

pkgver=1.1.0
pkgrel=1

provides=('hyperfine')
conflicts=('hyperfine')
arch=('x86_64' 'i686')

source_x86_64=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7c52d52ff1a03b4244dbc9522baf875d7c627466547622801a853878a3087987')

source_i686=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_i686=('0ba32336a0f2bf09767b039788d3eda8c49dcd4cac55d75641993f019484e216')

package() {
    cd "${srcdir}/${pkgname/-bin}-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm 644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-APACHE"
    install -Dm 644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-MIT"
    install -Dm 755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
