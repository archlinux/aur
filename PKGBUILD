# Maintainer: Nico <desoxhd@gmail.com>
pkgname=plasma5-applets-latte-sidebar-button
_pkgname=applet-latte-sidebar-button
pkgver=0.1.1
pkgrel=1
pkgdesc="Plasma applet to show and hide Latte Sidebars"
arch=('any')
url="https://github.com/psifidotos/$_pkgname"
license=('GPL2')
depends=('plasma-workspace')
source=("$pkgname-$pkgver.tar.gz::https://github.com/psifidotos/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('565432c97525fbe9754ac0cfbde2fbc689203ba2902c7a9e2e3649e40de903c4')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.latte.sidebarbutton"
    
    install -Dm644 metadata.desktop -t "$_pkgdir"
    find contents/ -type f -exec install -Dm644 "{}" "$_pkgdir/{}" \;
}
