## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=mcpelauncher-appimage
_pkgver=0.14.1-790
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
    "${pkgname}.png::https://minecraft.wiki/images/Bedrock_Edition_App_Store_icon_2.png"
    "mcpelauncher.desktop")
noextract=("${pkgname}_${_pkgver}.AppImage")
sha256sums=('22ec68127de07573829d8cc6a7049dad6cfcf2a6369a4ded2431c2c88e472a88'
            'f885ae28409754af415aec63ce71c134f61dee1d6960c23dbc7b5d7b35dc6d47'
            'bc94fe1c6b6849569961e9807baf32e71e1275a0c9b2b589141ca9067b9c4732')

package() {
    # Install icon
    install -Dm644 "${srcdir}"/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
    # Install desktop file
    install -Dm644 mcpelauncher.desktop "${pkgdir}"/usr/share/applications/mcpelauncher.desktop
    # Install binary
    install -Dm755 "${srcdir}"/"${pkgname}"_"${_pkgver}".AppImage "${pkgdir}"/usr/bin/mcpelauncher
}
