# Maintainer: Nico <desoxhd@gmail.com>
pkgname=plasma5-applets-latte-sidebar-button
_pkgname=applet-latte-sidebar-button
pkgver=0.1.2
pkgrel=1
pkgdesc="Plasma applet to show and hide Latte Sidebars"
arch=('any')
url="https://github.com/psifidotos/$_pkgname"
license=('GPL2')
depends=('plasma-workspace')
source=("$pkgname-$pkgver.tar.gz::https://github.com/psifidotos/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('7c69bdeaf3dbf37026c78fc4dae842c9cc2f029330acb18c7d1ee3397cae1424')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.latte.sidebarbutton"
    
    install -Dm644 metadata.desktop -t "$_pkgdir"
    find contents/ -type f -exec install -Dm644 "{}" "$_pkgdir/{}" \;
}
