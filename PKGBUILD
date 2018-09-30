# Maintainer: cauebs <cauebs@pm.me>

pkgname="hyperfine-bin"
pkgdesc="A command-line benchmarking tool - Precompiled binary from official repository"
url="https://github.com/sharkdp/hyperfine"
license=("APACHE" "MIT")

pkgver=1.3.0
pkgrel=1

provides=('hyperfine')
conflicts=('hyperfine')
arch=('x86_64' 'i686')

source_x86_64=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cc452ee2f2938860633694ff1e00041e5433194d242de599859bcae24f28e136')

source_i686=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_i686=('6164ce50d64e8a2e7b72366f1551006eac07490626ca11b2889a1f9117dc9355')

package() {
    cd "${srcdir}/${pkgname/-bin}-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm 644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-APACHE"
    install -Dm 644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-MIT"
    install -Dm 755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
