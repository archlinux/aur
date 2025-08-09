# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=3.36
pkgrel=2
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
sha256sums_i686=('1ec84d6ac3accc9ac59586b5369f190adc792488b62cb3a52ee59983f275071e' 'SKIP')
sha256sums_x86_64=('46ecba00a860e34a20900b56e54f04ce0561b224cb82bc86e6afede59ca6a1b9' 'SKIP')
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
