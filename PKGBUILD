# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_pkgname=applet-latte-separator
pkgname=plasma5-applets-latte-separator
pkgver=0.1.1
pkgrel=1
pkgdesc="Plasma applet that acts as a separator between applets"
arch=('any')
url="https://github.com/psifidotos/$_pkgname"
license=('GPL')
depends=('plasma-workspace')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6db95a7d8a9518a9ef2b7f0c4a99e2d33ae4de3d3876729484ef0d268b103a54')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.latte.separator"

    install -Dm644 metadata.desktop -t "$_pkgdir"
    find contents/ -type f -exec install -Dm644 "{}" "$_pkgdir/{}" \;
}
