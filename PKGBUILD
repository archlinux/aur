# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=plasma5-applets-latte-sidebar-button
_pkgname=applet-latte-sidebar-button
pkgver=0.2.0
pkgrel=1
pkgdesc="Plasma applet to show and hide Latte Sidebars"
arch=('any')
url="https://github.com/psifidotos/$_pkgname"
license=('GPL2')
depends=('plasma-workspace')
source=("$pkgname-$pkgver.tar.gz::https://github.com/psifidotos/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('9bef2d7fad8fa023a02d995673d23f2c3af9d7b598509ddb3a689590b9831418')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.latte.sidebarbutton"
    
    install -Dm644 metadata.desktop -t "$_pkgdir"
    find contents/ -type f -exec install -Dm644 "{}" "$_pkgdir/{}" \;
}
