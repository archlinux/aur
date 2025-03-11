pkgname=diylc
pkgver=5.0.0
pkgrel=1
pkgdesc="Multi platform circuit layout and schematic drawing tool"
arch=('any')
url="https://bancika.github.io/diy-layout-creator/"
license=('GPL3')
depends=('jre23-openjdk' 'sh' 'hicolor-icon-theme')
optdepends=()
makedepends=('unzip')
source=(
    "https://github.com/bancika/diy-layout-creator/releases/download/v${pkgver}/diylc-${pkgver}.zip"
    "diylc"
    "diylc.desktop"
    "bancika-diylc.xml"	
)
sha256sums=('b7e9ade0b12e76c7ec2fe9f9646cdf25bb99af17d942110e40cc7de38fcae754'
            '8bb6683fda8d5bce5beba32f9aac63cc0a0a7cb65da9469bd6d40343da38d3dc'
            'ab080ea3c5baf0dc310f13ae269b9ff81944bb1e6c24173269c047887ebf33b1'
            '17463b5025126faf458a9eda0a84f38dbc1e084470c9633ba9660ef4eb3fcca8')
noextract=("diylc-$pkgver.zip")

package() {
    install -d "$pkgdir/usr/share/diylc"
    unzip "$srcdir/diylc-${pkgver}.zip" -d "$pkgdir/usr/share/diylc"

    install -Dm755 "$srcdir/diylc" "$pkgdir/usr/bin/diylc"
    install -Dm644 "$srcdir/diylc.desktop" "$pkgdir/usr/share/applications/diylc.desktop"
    install -Dm644 "$srcdir/bancika-diylc.xml" "$pkgdir/usr/share/mime/packages/bancika-diylc.xml"

    install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/diylc.png"
    install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/diylc.png"
    install -Dm644 "$pkgdir/usr/share/diylc/icons/icon_48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/diylc.png"
}
