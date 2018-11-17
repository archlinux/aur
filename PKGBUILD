# Maintainer: Zhu Chuang <genelocated at foxmail dot com>

pkgname=plasma5-applets-tiledmenu
pkgver=25
pkgrel=1
pkgdesc="A menu based on Windows 10's Start Menu."
arch=(any)
url="https://store.kde.org/p/1160672/"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects)
source=("https://github.com/Zren/plasma-applet-tiledmenu/archive/v$pkgver.tar.gz"
        "metadata.desktop")
md5sums=('cabb28cd9ab13f091bb95d79151ef0f1'
         '44ea91d5c5e31bfaf97a4d66ae8aa858')

package() {
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.tiledmenu"
    mkdir -p "$_pkgdir"
    cp -r plasma-applet-tiledmenu-$pkgver/package/* "$_pkgdir"
    # In /usr/share/plasma/plasmoid, KDE Plasma recognize applets named "org.kde.*" only.
    cp "metadata.desktop" "$_pkgdir" 
}
