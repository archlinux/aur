# Maintainer: Zhu Chuang <genelocated at foxmail dot com>

pkgname=plasma5-applets-tiledmenu
_pkgname=plasma-applet-tiledmenu
pkgver=42
pkgrel=2
pkgdesc="A menu based on Windows 10's Start Menu."
arch=(any)
url="https://store.kde.org/p/1160672/"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects)
source=("https://github.com/Zren/plasma-applet-tiledmenu/archive/v$pkgver.tar.gz")
sha256sums=('ba7dcbd6d9760e23f7298acb8779804e0551926d30bdc000a65be0cd37740256')

package() {
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.tiledmenu"
    mkdir -p "$_pkgdir"
    cp -r "$_pkgname-$pkgver/package/." "$_pkgdir"
    # In /usr/share/plasma/plasmoid, KDE Plasma recognize applets named "org.kde.*" only.
    sed -i 's|com.github.zren.tiledmenu|org.kde.plasma.tiledmenu|g' "$_pkgdir/metadata.desktop"
}
