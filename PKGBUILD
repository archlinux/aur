# Maintainer: 1F616EMO <root at 1f616emo dot xyz>

pkgname=mixing-station-pc
pkgver=2.0.2
pkgrel=1
pkgdesc='Mixer remote control for multiple mixers'
arch=('any')
url='https://mixingstation.app/'
license=('custom:proprietary')
depends=('jre11-openjdk' 'zenity')
provides=('mixing-station')
source=(
    "$pkgname-$pkgver-release.zip::https://mixingstation.app/backend/api/web/download/update/mixing-station-pc/release"
    'mixing-station-pc'
    'copyright.txt'
    'ms-icon.png::https://mixingstation.app/ms-docs/assets/ms.png'
    'mixing-station-pc.desktop')
sha256sums=(
    '2935de387aed7133f28752616192326ae493b7d5d6eb38e5e224c9329d852885' # release.zip
    '580d7cc409d3a2d218f3da9f30ce98a177ffaf29a5f14703fa3b8c0a285d5e57' # mixing-station-pc
    'a5d350e62b37f9394944421d94aaa1a823f396a0e76727cb37898029bc5d77bf' # copyright.txt
    '2a9b5fedbaf45ff7c7822b9cfc6dd50541b68ca39545611814f034608c2f9a00' # ms-icon.png
    '9a957552b7f5f0b41ebf0d840185eab4873478d119507951fc7c9449f56e008d' # mixing-station-pc.desktop
)
# noextract=("$pkgname-$pkgver-release.zip")
# prepare() {
#     unzip "$pkgname-$pkgver-release.zip" "mixing-station-pc.jar"
# }
package() {
    # Java Script
    install -m 0755 -d "$pkgdir/usr/share/java/mixing-station-pc"
    install -m 0644 "mixing-station-pc.jar" "$pkgdir/usr/share/java/mixing-station-pc/mixing-station-pc.jar"

    # Shell wrapper
    install -m 0755 -d "$pkgdir/usr/bin"
    install -m 0755 "mixing-station-pc" "$pkgdir/usr/bin/mixing-station-pc"

    # License
    install -m 0755 -d "$pkgdir/usr/share/licenses/mixing-station-pc"
    install -m 0644 "copyright.txt" "$pkgdir/usr/share/licenses/mixing-station-pc/copyright.txt"

    # Icon
    install -m 0755 -d "$pkgdir/usr/share/mixing-station-pc"
    install -m 0644 "ms-icon.png" "$pkgdir/usr/share/mixing-station-pc/icon.png"

    # Desktop
    install -m 0755 -d "$pkgdir/usr/share/applications/"
    install -m 0644 "mixing-station-pc.desktop" "$pkgdir/usr/share/applications/mixing-station-pc.desktop"
}
