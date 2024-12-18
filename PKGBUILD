# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=3.31
pkgrel=1
pkgdesc="Tixati is a peer-to-peer file sharing program that uses the popular BitTorrent protocol"
arch=('i686' 'x86_64')
url='http://www.tixati.com/'
license=('custom:tixati')
depends=('gtk2' 'hicolor-icon-theme' 'dbus-glib' 'traceroute')
optdepends=('gconf: for shell integration')
install='tixati.install'
source=('LICENSE')
source_i686=("https://download.tixati.com/$pkgname-${pkgver}-1.i686.manualinstall.tar.gz")
source_x86_64=("https://download.tixati.com/$pkgname-${pkgver}-1.x86_64.manualinstall.tar.gz")
sha256sums=('4b8bc7a9be3ad1300dd8e90cbf5af96a597379c3b994ee0793990fee3290c8d2')
sha256sums_i686=('80b658fca724faa5efde6f5e84cfc5f1f4dc812c3980f02737e7d45e025cbe2d')
sha256sums_x86_64=('f444dc33ec8088333d1bf4c59041938194fc21699fe5d695470f04e6a44bebc0')

package() {
  cd "$srcdir/$pkgname-${pkgver}-1.$CARCH.manualinstall"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
