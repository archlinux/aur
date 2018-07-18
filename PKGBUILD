# Maintainer: cauebs <cauebs@pm.me>

pkgname="hyperfine-bin"
pkgdesc="A command-line benchmarking tool - Precompiled binary from official repository"
url="https://github.com/sharkdp/hyperfine"
license=("APACHE" "MIT")

pkgver=1.2.0
pkgrel=1

provides=('hyperfine')
conflicts=('hyperfine')
arch=('x86_64' 'i686')

source_x86_64=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9f53db94c095cf43d5f92d9b7f2796065d17279ffff3aeea879ec0028b79f57a')

source_i686=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_i686=('9c40ee9f7c04c905513bdef70951a90d2585aa59fc0b5bacb70f142b376a038c')

package() {
    cd "${srcdir}/${pkgname/-bin}-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm 644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-APACHE"
    install -Dm 644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-MIT"
    install -Dm 755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
