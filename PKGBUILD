# Maintainer: Zhu Chuang <genelocated at foxmail dot com>

pkgname=plasma5-applets-tiledmenu
pkgver=36
pkgrel=1
pkgdesc="A menu based on Windows 10's Start Menu."
arch=(any)
url="https://store.kde.org/p/1160672/"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects)
source=("https://github.com/Zren/plasma-applet-tiledmenu/archive/v$pkgver.tar.gz")
md5sums=('0cc86f45ffd955fcb4f7b5b3b85fca71')

package() {
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.tiledmenu"
    mkdir -p "$_pkgdir"
    cp -r plasma-applet-tiledmenu-$pkgver/package/* "$_pkgdir"
    # In /usr/share/plasma/plasmoid, KDE Plasma recognize applets named "org.kde.*" only.
    sed -i 's|com.github.zren.tiledmenu|org.kde.plasma.tiledmenu|g' $_pkgdir/metadata.desktop
}
