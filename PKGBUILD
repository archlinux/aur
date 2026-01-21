pkgname=diylc
pkgver=5.10.0
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
)
sha256sums=('d5688243f508ceb139a0c7efc07e75f0ace306644f542c1302fd83c6b2b3c47e'
            '74ab218dcf32c54b518614705127cfe22596754a73da80afa147d764cc7bd1df'
            'ab080ea3c5baf0dc310f13ae269b9ff81944bb1e6c24173269c047887ebf33b1'
            '17463b5025126faf458a9eda0a84f38dbc1e084470c9633ba9660ef4eb3fcca8')

package() {
    install -d "$pkgdir/usr/share/diylc"
    install -Dm755 "$srcdir/diylc-${pkgver}-universal/diylc.jar" "$pkgdir/usr/share/diylc/"
    install -Dm755 "$srcdir/diylc-${pkgver}-universal/run.sh" "$pkgdir/usr/share/diylc/"
    install -Dm755 "$srcdir/diylc" "$pkgdir/usr/bin/diylc"
    install -Dm644 "$srcdir/diylc.desktop" "$pkgdir/usr/share/applications/diylc.desktop"
    install -Dm644 "$srcdir/bancika-diylc.xml" "$pkgdir/usr/share/mime/packages/bancika-diylc.xml"

    install -Dm644 "$srcdir/diylc-${pkgver}-universal/icons/icon_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/diylc.png"
    install -Dm644 "$srcdir/diylc-${pkgver}-universal/icons/icon_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/diylc.png"
    install -Dm644 "$srcdir/diylc-${pkgver}-universal/icons/icon_48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/diylc.png"


}
