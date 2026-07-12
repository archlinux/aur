# Maintainer: MicLeh <micleh at proton dot me>	
pkgname=kova
pkgver=0.6.17
pkgrel=1
pkgdesc="Markdown presentation authoring tool with live preview, multiple layouts, theming, and PPTX export"
arch=('x86_64')
url="https://kova.md/"
license=('GPL-3.0-or-later')
depends=(
    'webkit2gtk-4.1'
    'libjxl'
    'libavif'
    'hicolor-icon-theme'
)
optdepends=(
    'gst-plugins-bad: support for additional media formats'
)
source=("https://github.com/KovaMD/Kova/releases/download/v${pkgver}/Kova_${pkgver}_x86_64.tar.gz")
sha256sums=('0bbe5951c48368fdd52371a3b9b166ff66e4ea896c12608a35f05286d635e368')

package() {
    cd "$srcdir/kova"

    install -Dm755 kova "$pkgdir/usr/bin/kova"

    install -Dm644 kova.desktop "$pkgdir/usr/share/applications/kova.desktop"

    install -Dm644 icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/kova.png"
    install -Dm644 icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/kova.png"
    install -Dm644 icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/kova.png"
    install -Dm644 icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/kova.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
