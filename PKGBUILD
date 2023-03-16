## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=mcbelauncher-bin
pkgver=0.8.5
pkgrel=708
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64")
url="https://mcpelauncher.readthedocs.io"
license=("GPL3")
groups=()
depends=(fuse2)
makedepends=()
checkdepends=()
optdepends=('zenity: custom skin picker')
provides=(mcbelauncher)
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver.AppImage::https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v$pkgver-$pkgrel/Minecraft_Bedrock_Launcher-x86_64-v$pkgver.$pkgrel.AppImage"
    "$pkgname.png::https://static.wikia.nocookie.net/minecraft_gamepedia/images/9/98/Bedrock_Edition_Google_Play_icon.png"
    "mcbelauncher.desktop")
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('87af1903be42531930f849e6450ffb71777de75b06cd248e8181598a7239b807'
            'd676e742b549cf7b4698cb9dc5be5f1734bc59313958cf9a7b7acd92a5ff3d76'
            '3ae613839cf1020192527621f97b8958394a2ff9dac6567cb16c5e76f0386e2d')

package() {
    # Install icon
    install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/mcbe.png
    # Install desktop file
    install -Dm644 mcbelauncher.desktop "${pkgdir}"/usr/share/applications/mcbelauncher.desktop
    # Install binary
    install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}".AppImage "${pkgdir}"/usr/bin/mcbelauncher
}
