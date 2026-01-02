# Maintainer: Ben H <bcherb2@users.noreply.github.com>
pkgname=ffdash-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="VP9 video encoder with live TUI dashboard and hardware acceleration"
arch=('x86_64')
url="https://github.com/bcherb2/ffdash"
license=('MIT')
depends=('ffmpeg')
provides=('ffdash')
conflicts=('ffdash')
source=(
    "ffdash-${pkgver}.tar.gz::https://github.com/bcherb2/ffdash/releases/download/v${pkgver}/ffdash-linux-x86_64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/bcherb2/ffdash/v${pkgver}/LICENSE"
)
sha256sums=(
    '776e312895d4d67753e358bacab55e36d1273198318ccf05a4a5d989bb8cce37'
    'SKIP'
)

package() {
    install -Dm755 "${srcdir}/ffdash" "${pkgdir}/usr/bin/ffdash"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
