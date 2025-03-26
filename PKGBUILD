pkgname=diylc
pkgver=5.1.0
pkgrel=1
pkgdesc="Multi platform circuit layout and schematic drawing tool"
arch=('any')
url="https://bancika.github.io/diy-layout-creator/"
license=('GPL3')
depends=('java-runtime>=24' 'sh' 'hicolor-icon-theme')
optdepends=()
makedepends=('unzip')
source=(
    "https://github.com/bancika/diy-layout-creator/releases/download/v${pkgver}/diylc-${pkgver}-universal.zip"
    "diylc"
    "diylc.desktop"
    "bancika-diylc.xml"
    "icon_16x16.png"
    "icon_32x32.png"
    "icon_48x48.png"
)
sha256sums=('93f2947d88e16535c2a6e03bc51730bcb555d7e219f301c90c81dd410dae108f'
            '74ab218dcf32c54b518614705127cfe22596754a73da80afa147d764cc7bd1df'
            'ab080ea3c5baf0dc310f13ae269b9ff81944bb1e6c24173269c047887ebf33b1'
            '17463b5025126faf458a9eda0a84f38dbc1e084470c9633ba9660ef4eb3fcca8'
            'aec20fa0f275b86232bf800304ed53e1980b528230527bde3671941514b2b623'
            '36729abb04a9a8b4a819c9d66caa9cc652bc3bca93951892a62a88779d465dc4'
            'f7be8191f7e0a746a18fe26ccfd62e127121ed58010e755010d947a951d43288')

package() {
    install -d "$pkgdir/usr/share/diylc"
    install -Dm755 "$srcdir/diylc-${pkgver}/diylc.jar" "$pkgdir/usr/share/diylc/"
    install -Dm755 "$srcdir/diylc-${pkgver}/run.sh" "$pkgdir/usr/share/diylc/"
    install -Dm755 "$srcdir/diylc" "$pkgdir/usr/bin/diylc"
    install -Dm644 "$srcdir/diylc.desktop" "$pkgdir/usr/share/applications/diylc.desktop"
    install -Dm644 "$srcdir/bancika-diylc.xml" "$pkgdir/usr/share/mime/packages/bancika-diylc.xml"

    # Use this if upstream returns to including icons in the release
    #install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/diylc.png"
    #install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/diylc.png"
    #install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/diylc.png"

    install -Dm644 "$srcdir/icon_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/diylc.png"
    install -Dm644 "$srcdir/icon_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/diylc.png"
    install -Dm644 "$srcdir/icon_48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/diylc.png"
}
