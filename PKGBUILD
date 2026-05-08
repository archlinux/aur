# Maintainer: ismailivanov <https://github.com/ismailivanov>
pkgname=godot-hub-bin
pkgver=1.0
pkgrel=1
pkgdesc="Desktop app for managing Godot Engine versions and projects"
arch=('x86_64')
url="https://github.com/ismailivanov/godot-hub"
license=('MIT')
provides=('godot-hub')
conflicts=('godot-hub')
source=(
    "Linux.zip::https://github.com/ismailivanov/godot-hub/releases/download/v${pkgver}/Linux.zip"
    "godot-hub.png::https://raw.githubusercontent.com/ismailivanov/godot-hub/v${pkgver}/assets/godothub_logo_without_bg.png"
    "LICENSE::https://raw.githubusercontent.com/ismailivanov/godot-hub/v${pkgver}/LICENSE"
    "godot-hub.desktop"
)
sha256sums=(
    '1c82200e9b94c195d8f61b2af50834829bf0b533387a5b2408423f1e05b1b1bb'
    '5043631b7129f68c2dfe119b24812d7bce188369a3b0447b02430babcec52a04'
    '76b8e9aacad7b9b2fd0c699065186191f8705d8f1892ee36873c56f904f073ef'
    'ae5dc922d2f390ddefb7009c949242de295729595aa00fc2f3357be683935507'
)

package() {
    install -Dm755 "${srcdir}/GodotHub.x86_64"  "${pkgdir}/usr/bin/godot-hub"
    install -Dm644 "${srcdir}/godot-hub.png"    "${pkgdir}/usr/share/pixmaps/godot-hub.png"
    install -Dm644 "${srcdir}/godot-hub.desktop" \
        "${pkgdir}/usr/share/applications/godot-hub.desktop"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
