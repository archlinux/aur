# Maintainer: ismailivanov <https://github.com/ismailivanov>
pkgname=godot-hub-bin
pkgver=1.2.8
pkgrel=1
pkgdesc="Desktop app for managing Godot Engine versions and projects"
arch=('x86_64')
url="https://github.com/ismailivanov/godot-hub"
license=('MIT')
provides=('godot-hub')
conflicts=('godot-hub')
install=godot-hub-bin.install
source=(
    "GodotHub-Linux-${pkgver}.zip::https://github.com/ismailivanov/godot-hub/releases/download/v${pkgver}/GodotHub-Linux.zip"
    "godothub-${pkgver}.svg::https://raw.githubusercontent.com/ismailivanov/godot-hub/v${pkgver}/assets/logo/logo.svg"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ismailivanov/godot-hub/v${pkgver}/LICENSE"
    "godot-hub.desktop"
    "godot-hub-bin.install"
)
sha256sums=('f0ce801d670e1905ccf39e8e9d8964d470720c1f3a0b69faa97a9b79f7c32069'
            '3f4e46e17ce981776edaacd2b534a49746bb09cd189f7ac08bb7334e0d95e555'
            'ef92b4be2ed32e2d785634bfe8e9cf157e9069ffcb3e5ef8ecac4244355e8852'
            '00d7dc9a289643902a5edcb3d0eb4c8b62102144eb06b729fcbd367f36a25500'
            '626515c6b3bc25581210fb80ab43d8fb8d6655e5253152db9ce4991380e9e4bd')

package() {
    install -Dm755 "${srcdir}/GodotHub.x86_64"  "${pkgdir}/usr/bin/godot-hub"
    install -Dm644 "${srcdir}/godothub-${pkgver}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/godothub.svg"
    install -Dm644 "${srcdir}/godot-hub.desktop" \
        "${pkgdir}/usr/share/applications/GodotHub.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
