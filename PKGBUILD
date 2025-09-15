# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=3.38
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
sha256sums_i686=('ce9d62b785c2cdf8dfa9d8572a1b40ebaa9e01f828bde26f126fc75ccd4eccec'
                 'SKIP')
sha256sums_x86_64=('ba39439ff0d547b4e46f9ee68e636b878e9db25e6f39193a3c5d596230c1dc8f'
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
