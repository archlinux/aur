# Maintainer: ismailivanov <https://github.com/ismailivanov>
pkgname=godot-hub-bin
pkgver=1.2
pkgrel=1
pkgdesc="Desktop app for managing Godot Engine versions and projects"
arch=('x86_64')
url="https://github.com/ismailivanov/godot-hub"
license=('MIT')
provides=('godot-hub')
conflicts=('godot-hub')
install=godot-hub-bin.install
source=(
    "GodotHub-Linux.zip::https://github.com/ismailivanov/godot-hub/releases/download/v${pkgver}/GodotHub-Linux.zip"
    "godot-hub.png::https://raw.githubusercontent.com/ismailivanov/godot-hub/v${pkgver}/icon.png"
    "LICENSE::https://raw.githubusercontent.com/ismailivanov/godot-hub/v${pkgver}/LICENSE"
    "godot-hub.desktop"
    "godot-hub-bin.install"
)
sha256sums=('2892560dece9dbd4ac9c230bb97ac8e60a3185e5f08d5f03057e103206ec2dbb'
            '107c2380d91ea34b00d10370ea0ea2b744b7cf13b0bf1b26bf198d3b5687a2bc'
            'ef92b4be2ed32e2d785634bfe8e9cf157e9069ffcb3e5ef8ecac4244355e8852'
            'f5d3bea291b02ff5df233ec5e399d7f0a2f3887966095ab6eaba656801f15bbb'
            '626515c6b3bc25581210fb80ab43d8fb8d6655e5253152db9ce4991380e9e4bd')

package() {
    install -Dm755 "${srcdir}/GodotHub.x86_64"  "${pkgdir}/usr/bin/godot-hub"
    install -Dm644 "${srcdir}/godot-hub.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/godot-hub.png"
    install -Dm644 "${srcdir}/godot-hub.desktop" \
        "${pkgdir}/usr/share/applications/godot-hub.desktop"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
