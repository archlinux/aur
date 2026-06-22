# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=3.44
pkgrel=1
pkgdesc="Tixati is a peer-to-peer file sharing program that uses the popular BitTorrent protocol"
arch=('i686' 'x86_64')
url='http://www.tixati.com/'
license=('custom:tixati')
depends=('gtk3' 'hicolor-icon-theme' 'dbus-glib' 'traceroute')
optdepends=('gconf: for shell integration')
source=('LICENSE')
source_i686=("https://download.tixati.com/${pkgname}-${pkgver}-1.i686.manualinstall.tar.gz"{,.asc})
source_x86_64=("https://download.tixati.com/${pkgname}-${pkgver}-1.x86_64.manualinstall.tar.gz"{,.asc})
sha256sums=('SKIP')
sha256sums_i686=('237467c8deec920a722d493766e1489fab31f00d080e8378f59a02f05ae12f94'
                 'SKIP')
sha256sums_x86_64=('3b060019a48eb7a9b7bd01460accebc4079e1a3105ea77ec66ccd7bc95f8911f'
                   'SKIP')
validpgpkeys=('9DEA5E350F9D285E46D3B7E3CE737F191AF5DCFB')

package() {
  cd "$srcdir/$pkgname-${pkgver}-1.$CARCH.manualinstall"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
