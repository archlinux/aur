## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=mcbelauncher-bin
pkgver=0.5.0.693
pkgrel=1
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64")
url="https://mcpelauncher.readthedocs.io"
license=("GPL3")
groups=()
depends=(fuse2)
makedepends=()
checkdepends=()
optdepends=(zenity)
provides=(mcbelauncher)
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver.AppImage::https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v0.5.0-693/Minecraft_Bedrock_Launcher-x86_64-v0.5.0.693.AppImage"
    "$pkgname.png::https://static.wikia.nocookie.net/minecraft_gamepedia/images/9/98/Bedrock_Edition_Google_Play_icon.png"
    "mcbelauncher.desktop")
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('74bd1a2e6288cc9d4f5dc9aa2f97fdeab8f389b0881114d40a60e2c8a45479c7'
    'd676e742b549cf7b4698cb9dc5be5f1734bc59313958cf9a7b7acd92a5ff3d76'
    '664e135dd1e9a44cd8c8f16a7c615698ee2fc2b761f18eab648e9635a1a4c768')

package() {
    # Install icon
    install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/mcbe.png
    # Install desktop file
    install -Dm644 mcbelauncher.desktop "${pkgdir}"/usr/share/applications/mcbelauncher.desktop
    # Install binary
    install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}".AppImage "${pkgdir}"/usr/bin/mcbelauncher
}
