# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fortio-bin
pkgver=1.69.5
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
sha256sums_aarch64=('79f087b27ca7ecc65fbb2ebcb03feb5e9627cc7489a51b9d2e6c358cb73bbfed')
sha256sums_x86_64=('55b9bec4b86399fa57c05de4bc1f4bb28a8e3c66fe033cd400a1ad46f1fb7298')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname%-bin}.1" -t "${pkgdir}/usr/share/man/man1"
}
