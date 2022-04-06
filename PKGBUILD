## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=mcbelauncher-bin
pkgver=0.3.3.683
pkgrel=1
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
    '895226cc5eda60dc0ba7f835bf911942390d004b3ee2559d93ff4a37f4e34ea7')

package() {
    # Install image
    install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/mcbe.png
    # Install desktop file
    install -Dm644 mcbelauncher.desktop "${pkgdir}"/usr/share/applications/mcbelauncher.desktop
    # Install binary
    install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}".AppImage "${pkgdir}"/usr/bin/mcbelauncher
}
