# Maintainer: Zhu Chuang <genelocated at foxmail dot com>

pkgname=plasma5-applets-tiledmenu
pkgver=26
pkgrel=1
pkgdesc="A menu based on Windows 10's Start Menu."
arch=(any)
url="https://store.kde.org/p/1160672/"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects)
source=("https://github.com/Zren/plasma-applet-tiledmenu/archive/v$pkgver.tar.gz"
        "metadata.desktop")
md5sums=('74ce56accade2cc7422474bcc89b24a2'
         '11a313cbf05bd0657c76162179f45048')

package() {
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.tiledmenu"
    mkdir -p "$_pkgdir"
    cp -r plasma-applet-tiledmenu-$pkgver/package/* "$_pkgdir"
    # In /usr/share/plasma/plasmoid, KDE Plasma recognize applets named "org.kde.*" only.
    cp "metadata.desktop" "$_pkgdir" 
}
