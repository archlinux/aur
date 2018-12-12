# Maintainer: cauebs <cauebs@pm.me>

pkgname="hyperfine-bin"
pkgdesc="A command-line benchmarking tool - Precompiled binary from official repository"
url="https://github.com/sharkdp/hyperfine"
license=("APACHE" "MIT")

pkgver=1.5.0
pkgrel=1

provides=('hyperfine')
conflicts=('hyperfine')
arch=('x86_64' 'i686')

source_x86_64=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('819de95779617e0fe41b667fa0fd587493f5300338366d0f88947d56d1556e6f')

source_i686=("${url}/releases/download/v${pkgver}/hyperfine-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_i686=('039c8133523214a18ce68c0b115183e79a229db9c56544ceded8c310b54020a9')

package() {
    cd "${srcdir}/${pkgname/-bin}-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm 644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-APACHE"
    install -Dm 644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE-MIT"
    install -Dm 755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
