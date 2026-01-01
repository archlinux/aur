# Maintainer: Ben H <bcherb2@users.noreply.github.com>
pkgname=ffdash-bin
pkgver=0.2.0
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
    'fc5c76898b5c9e49009aec9a296718301d6603a2622c556bed758ca243c60294'
    'SKIP'
)

package() {
    install -Dm755 "${srcdir}/ffdash" "${pkgdir}/usr/bin/ffdash"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
