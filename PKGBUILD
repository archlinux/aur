# Maintainer: Your Name <youremail@domain.com>
pkgname=minecraft-ftb-launcher
pkgver=20171221
pkgrel=1
pkgdesc="An easy way to download and play minecraft modpacks"
arch=('any')
url="https://www.feed-the-beast.com/"
license=('unknown')
depends=('java-runtime=8' 'hicolor-icon-theme' 'bash')
optdepends=()
replaces=()
backup=()
install=
changelog=
source=("http://ftb.cursecdn.com/FTB2/launcher/FTB_Launcher.jar"
        "ftb-launcher"
        "ftb-launcher.desktop")
noextract=('FTB_Launcher.jar')
md5sums=('e185c691bdedbfa69aa27117b1b15286'
         '31635687fa0eb37d3b955012f5c54d70'
         'bd1c8e49f866c63efacfb7b6f94e9e31')
validpgpkeys=()
pkgver() {
    date +%Y%m%d
}

package() {
  cd "$srcdir"
  install -D -m755 "${srcdir}/ftb-launcher" "${pkgdir}/usr/bin/ftb-launcher"
  install -D -m644 "$srcdir/FTB_Launcher.jar" "${pkgdir}/usr/share/ftb-launcher/FTB_Launcher.jar"
  bsdtar -xf "FTB_Launcher.jar" image/logo_ftb.png
  bsdtar -xf "FTB_Launcher.jar" image/logo_ftb_large.png
  install -D -m644 "${srcdir}/image/logo_ftb.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/ftb-launcher.png"
  install -D -m644 "${srcdir}/image/logo_ftb_large.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ftb-launcher.png"
  install -D -m644 "${srcdir}/ftb-launcher.desktop" "${pkgdir}/usr/share/applications/ftb-launcher.desktop"
}
