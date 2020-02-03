# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_pkgname=applet-latte-spacer
pkgname=plasma5-applets-latte-spacer
pkgver=0.3.0
pkgrel=1
pkgdesc="Plasma applet that acts as a spacer between applets"
arch=('any')
url="https://github.com/psifidotos/$_pkgname"
license=('GPL')
depends=('plasma-workspace')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('01629af849700dfd2f31f5896049bf5149465a70b45259050f91b7f2139ecf9a')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.latte.spacer"

    install -Dm644 metadata.desktop -t "$_pkgdir"
    find contents/ -type f -exec install -Dm644 "{}" "$_pkgdir/{}" \;
}
