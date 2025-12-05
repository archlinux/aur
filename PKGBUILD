# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=3.42
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
sha256sums_i686=('4b680efb4fa2c9dca74cd4fc3be267c5fc421f357a9e8338c75cf14a8b20067d'
                 'SKIP')
sha256sums_x86_64=('b6e7a3a104375bd3f2bc004f89e89895edd0632d8928da83bd1968ad2c4fb877'
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
