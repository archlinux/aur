# Maintainer: Nico <desoxhd@gmail.com>
pkgname=plasma5-applets-latte-sidebar-button
_pkgname=applet-latte-sidebar-button
pkgver=0.1.0
pkgrel=1
pkgdesc="Plasma applet to show and hide Latte Sidebars"
arch=('any')
url="https://github.com/psifidotos/$_pkgname"
license=('GPL2')
depends=('plasma-workspace')
source=("$pkgname-$pkgver.tar.gz::https://github.com/psifidotos/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('bb5f6cee7d04b148069f92e04c7b1bb1ed65f6aa951cffde925e3ae4f5f7395c')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.latte.sidebarbutton"
    
    install -Dm644 metadata.desktop -t "$_pkgdir"
    find contents/ -type f -exec install -Dm644 "{}" "$_pkgdir/{}" \;
}
