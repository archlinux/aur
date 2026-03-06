# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fortio-bin
pkgver=1.75.0
pkgrel=1
pkgdesc='Fortio load testing library, command line tool, advanced echo server and web UI in go (golang). Allows to specify a set query-per-second load and record latency histograms and other useful stats.(Prebuilt version)'
arch=(
    'aarch64'
    'x86_64'
)
url="https://fortio.org"
_ghurl="https://github.com/fortio/fortio"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('45c4ae89936238122e5aaceb74c3f2e3351429ac1350791c3d3861c97aa79116')
sha256sums_x86_64=('ef9a8140e16bedda8054ad91c0741b67c10b96198717ead611d8bbe8c8c96421')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname%-bin}.1" -t "${pkgdir}/usr/share/man/man1"
}
