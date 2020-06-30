# Maintainer: Zhu Chuang <genelocated at foxmail dot com>

pkgname=plasma5-applets-tiledmenu
pkgver=37
pkgrel=1
pkgdesc="A menu based on Windows 10's Start Menu."
arch=(any)
url="https://store.kde.org/p/1160672/"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects)
source=("https://github.com/Zren/plasma-applet-tiledmenu/archive/v$pkgver.tar.gz")
md5sums=('3c79a94b739ac293cbea28b2b23c9bc8')

package() {
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.tiledmenu"
    mkdir -p "$_pkgdir"
    cp -r plasma-applet-tiledmenu-$pkgver/package/* "$_pkgdir"
    # In /usr/share/plasma/plasmoid, KDE Plasma recognize applets named "org.kde.*" only.
    sed -i 's|com.github.zren.tiledmenu|org.kde.plasma.tiledmenu|g' $_pkgdir/metadata.desktop
}
