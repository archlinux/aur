# Maintainer: Ben H <bcherb2@users.noreply.github.com>
pkgname=ffdash-bin
pkgver=0.3.1
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
    '59c7c32b0672eb2a775e1db998f86a66f34c2dd187f1ecdbb34fbb3ee94d24ca'
    'SKIP'
)

package() {
    install -Dm755 "${srcdir}/ffdash" "${pkgdir}/usr/bin/ffdash"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
