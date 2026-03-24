# Maintainer: krmmyvz <https://github.com/krmmyvz>
pkgname=vibestreamer-bin
pkgver=1.3.3
pkgrel=1
pkgdesc='Modern IPTV player with Xtream Codes and M3U support (prebuilt binary)'
arch=('x86_64')
url='https://github.com/krmmyvz/vibestreamer'
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'mpv' 'zlib')
provides=('vibestreamer')
conflicts=('vibestreamer')
source=("Vibestreamer-linux-x86_64.tar.gz::https://github.com/krmmyvz/vibestreamer/releases/download/v${pkgver}/Vibestreamer-linux-x86_64.tar.gz"
        "vibestreamer.desktop::https://raw.githubusercontent.com/krmmyvz/vibestreamer/v${pkgver}/flatpak/io.github.krmmyvz.Vibestreamer.desktop"
        "vibestreamer.svg::https://raw.githubusercontent.com/krmmyvz/vibestreamer/v${pkgver}/logo_concept1.svg"
        "LICENSE::https://raw.githubusercontent.com/krmmyvz/vibestreamer/v${pkgver}/LICENSE")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    # Binary
    install -Dm755 bin/Vibestreamer "${pkgdir}/usr/bin/Vibestreamer"

    # Desktop entry
    install -Dm644 vibestreamer.desktop \
        "${pkgdir}/usr/share/applications/vibestreamer.desktop"

    # Icon
    install -Dm644 vibestreamer.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vibestreamer.svg"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
