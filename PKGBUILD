pkgname=diylc
pkgver=4.22.1
pkgrel=2
pkgdesc="Multi platform circuit layout and schematic drawing tool"
arch=('any')
url="https://bancika.github.io/diy-layout-creator/"
license=('GPL3')
depends=('jre11-openjdk' 'sh' 'hicolor-icon-theme')
optdepends=()
makedepends=('unzip')
source=(
    "https://github.com/bancika/diy-layout-creator/releases/download/v${pkgver}/diylc-${pkgver}.zip"
    "diylc"
    "diylc.desktop"
)
sha256sums=(
    '14507b7a9060c76bd0ff7bae09d082163165695fd6c52b55fba3868129a41a73'
    'SKIP'
    'SKIP'
)
noextract=("diylc-$pkgver.zip")

package() {
    install -d "$pkgdir/usr/share/diylc"
    unzip "$srcdir/diylc-${pkgver}.zip" -d "$pkgdir/usr/share/diylc"
    rm "$pkgdir/usr/share/diylc/diylc.exe"

    install -Dm755 "$srcdir/diylc" "$pkgdir/usr/bin/diylc"
    install -Dm644 "$srcdir/diylc.desktop" "$pkgdir/usr/share/applications/diylc.desktop"

    install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/diylc.png"
    install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/diylc.png"
    install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/diylc.png"
}
