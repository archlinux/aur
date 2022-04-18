## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=mcbelauncher-bin
pkgver=0.3.3.683
pkgrel=2
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64")
url="https://mcpelauncher.readthedocs.io"
license=("GPL3")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(mcbelauncher)
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver.AppImage::https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v0.3.3-683/Minecraft_Bedrock_Launcher-x86_64-v0.3.3.683.AppImage"
    "$pkgname.png::https://static.wikia.nocookie.net/minecraft_gamepedia/images/9/98/Bedrock_Edition_Google_Play_icon.png"
    "mcbelauncher.desktop")
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('53fe2e4a90f80f9e3be37dfff697fdab6b06f59e1ce52ccb40abc96f95c1d86a' 
    'd676e742b549cf7b4698cb9dc5be5f1734bc59313958cf9a7b7acd92a5ff3d76'
    '77e3b104ec0ff868ef799acf6c30cc971d3144e9ac9c072e95b1626befd7e787')

package() {
    # Install image
    install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/mcbe.png
    # Install desktop file
    install -Dm644 mcbelauncher.desktop "${pkgdir}"/usr/share/applications/mcbelauncher.desktop
    # Install binary
    install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}".AppImage "${pkgdir}"/usr/bin/mcbelauncher
}
