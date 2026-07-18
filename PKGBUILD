# Maintainer: MicLeh <micleh at proton dot me>	
pkgname=kova
pkgver=0.7.1
pkgrel=2
pkgdesc="Markdown presentation authoring tool with live preview, multiple layouts, theming, and PPTX export"
arch=('x86_64')
url="https://kova.md/"
license=('GPL-3.0-or-later')
depends=(
    'webkit2gtk-4.1'
    'libjxl'
    'libavif'
)
optdepends=(
    'gst-plugins-bad: support for additional media formats'
    'hicolor-icon-theme: install icon themes for best integration'
    'libayatana-appindicator: tray/taskbar indicator support'
)
source=("https://github.com/KovaMD/Kova/releases/download/v${pkgver}/Kova_${pkgver}_x86_64.tar.gz")
sha256sums=('8dd0e15939bc84ac7cf0d014ad63fe81ad53722afd89300b788fab46a1910da7')

package() {
    cd "$srcdir/kova"

    install -Dm755 kova "$pkgdir/usr/bin/kova"

    install -Dm644 kova.desktop "$pkgdir/usr/share/applications/kova.desktop"

    for size in 32x32 64x64 128x128; do
        install -Dm644 "icons/$size.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/kova.png"
    done
    install -Dm644 "icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/kova.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
