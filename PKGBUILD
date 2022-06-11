## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=mcbelauncher-bin
pkgver=0.3.4.688
pkgrel=4
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
source=("$pkgname-$pkgver.AppImage::https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v0.3.4-688/Minecraft_Bedrock_Launcher-x86_64-v0.3.4.688.AppImage"
    "$pkgname.png::https://static.wikia.nocookie.net/minecraft_gamepedia/images/9/98/Bedrock_Edition_Google_Play_icon.png"
    "mcbelauncher.desktop")
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('4cfefa4b2a5293d24838f9d21b3a589a9fa0e34444e290ae06601aa4beefab36' 
    'd676e742b549cf7b4698cb9dc5be5f1734bc59313958cf9a7b7acd92a5ff3d76'
    '2174d477aa2299c6bdb04bd6891b97c7965bce6083a2829f1f8fb5afe974aef6')

package() {
    # Install image
    install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/mcbe.png
    # Install desktop file
    install -Dm644 mcbelauncher.desktop "${pkgdir}"/usr/share/applications/mcbelauncher.desktop
    # Install binary
    install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}".AppImage "${pkgdir}"/usr/bin/mcbelauncher
}
