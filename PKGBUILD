pkgname=swiftpeek-bin
pkgver=0.1.0
pkgrel=3
pkgdesc="Ultralight file previewer written in Rust (precompiled binary)"
arch=('x86_64')
url="https://github.com/acosta-dev/SwiftPeek"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2' 'hicolor-icon-theme')
provides=('swiftpeek')
conflicts=('swiftpeek')

source=(
    "https://pub-a604c65ec55d4555ba01a5dab3d0e2b4.r2.dev/swiftpeek-${pkgver}-x86_64.tar.gz"
    "swiftpeek.desktop"
    "swiftpeek.svg"
)

sha256sums=(
    'bcf0d0a6d4fca7af1ed4072bcbbad076cbdad0a2311633e5ddaad86974c676b8'
    '3eaeaffd9037899ec947dc7f7083d7714f589aad00a95b65633b82bf299d671e'
    '71682ead9e9ae62f0617026a7a0bb78483b0ca0531c7a2798fe26eea932a4a12'
)

package() {
    # Binary
    install -Dm755 "${srcdir}/swiftpeek" "${pkgdir}/usr/bin/swiftpeek"

    # Desktop entry
    install -Dm644 "${srcdir}/swiftpeek.desktop" "${pkgdir}/usr/share/applications/swiftpeek.desktop"

    # Icon (SVG for hicolor theme — scales to any resolution)
    install -Dm644 "${srcdir}/swiftpeek.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/swiftpeek.svg"
}
