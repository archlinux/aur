## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=mcpelauncher-appimage
_pkgver=0.12.1-763
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64")
url="https://mcpelauncher.readthedocs.io"
license=("GPL3")
groups=()
depends=(fuse2)
makedepends=()
checkdepends=()
optdepends=('zenity: custom skin picker')
provides=(mcpelauncher)
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("${pkgname}_${_pkgver}.AppImage::https://github.com/minecraft-linux/appimage-builder/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-x86_64-v${pkgver}.AppImage"
    "${pkgname}.png::https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/48/Bedrock_Edition_icon.png"
    "mcpelauncher.desktop")
noextract=("${pkgname}_${_pkgver}.AppImage")
sha256sums=('1470b8fa7ce57416aed158919a07549369cf20f262f16238231413b73a4ed56e'
            'c631b790777cfe73799fbda79ab3d60096fc163af5669b86b2d2d7954aaea1c6'
            'd11d038cacc64d32294c4fd62be61c136269697d4c188b9ac71f8d3a3e95fca3')

package() {
    # Install icon
    install -Dm644 "${srcdir}"/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
    # Install desktop file
    install -Dm644 mcpelauncher.desktop "${pkgdir}"/usr/share/applications/mcpelauncher.desktop
    # Install binary
    install -Dm755 "${srcdir}"/"${pkgname}"_"${_pkgver}".AppImage "${pkgdir}"/usr/bin/mcpelauncher
}
