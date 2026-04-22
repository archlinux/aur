# Maintainer: Sofian Jafar <skjafar@gmail.com>
pkgname=dshub-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Desktop application for monitoring and controlling industrial devices via TCP/UDP"
arch=('x86_64')
url="https://github.com/skjafar/dshub"
license=('MIT')
provides=('dshub')
conflicts=('dshub')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'openssl'
    'libsoup3'
    'xdg-utils'
)
source=(
    "dshub-${pkgver}-linux-x86_64.zip::${url}/releases/download/v${pkgver}/dshub-linux-x86_64.zip"
    "dshub-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '5e5e055365abfcf78c0d7657ccff5efeff46b0b29d7a2cb6c5ef9a86434d66d2'
    'f55f618cac0e27c4ac1161212213b417cef2ab01de8ec0581c48aa762252b9bb'
)

package() {
    # Binary (from zip, extracted flat into srcdir)
    install -Dm755 "${srcdir}/dshub" \
        "${pkgdir}/usr/bin/dshub"

    cd "${srcdir}/dshub-${pkgver}"

    # Desktop entry
    install -Dm644 "aur/dshub.desktop" \
        "${pkgdir}/usr/share/applications/dshub.desktop"

    # Icons
    install -Dm644 "src-tauri/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dshub.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dshub.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dshub.png"

}
