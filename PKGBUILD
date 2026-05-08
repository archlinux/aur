# Maintainer: ismailivanov <https://github.com/ismailivanov>
pkgname=godot-hub-bin
pkgver=1.0
pkgrel=3
pkgdesc="Desktop app for managing Godot Engine versions and projects"
arch=('x86_64')
url="https://github.com/ismailivanov/godot-hub"
license=('MIT')
provides=('godot-hub')
conflicts=('godot-hub')
install=godot-hub-bin.install
source=(
    "Linux.zip::https://github.com/ismailivanov/godot-hub/releases/download/v${pkgver}/Linux.zip"
    "godot-hub.png::https://raw.githubusercontent.com/ismailivanov/godot-hub/v${pkgver}/icon.png"
    "LICENSE::https://raw.githubusercontent.com/ismailivanov/godot-hub/v${pkgver}/LICENSE"
    "godot-hub.desktop"
    "godot-hub-bin.install"
)
sha256sums=(
    '1c82200e9b94c195d8f61b2af50834829bf0b533387a5b2408423f1e05b1b1bb'
    'fb2973ac18502c9e828e9f4225980239033fa474847e8b69a0b8ef37f0a6a7cc'
    '76b8e9aacad7b9b2fd0c699065186191f8705d8f1892ee36873c56f904f073ef'
    'fefd49d931f5b8f9779cc4af01f96f8bd44fc9232b9e8193bbe2bdef8649618b'
    '626515c6b3bc25581210fb80ab43d8fb8d6655e5253152db9ce4991380e9e4bd'
)

package() {
    install -Dm755 "${srcdir}/GodotHub.x86_64"  "${pkgdir}/usr/bin/godot-hub"
    install -Dm644 "${srcdir}/godot-hub.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/godot-hub.png"
    install -Dm644 "${srcdir}/godot-hub.desktop" \
        "${pkgdir}/usr/share/applications/godot-hub.desktop"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
