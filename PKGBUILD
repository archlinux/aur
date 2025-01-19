# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=3.32
pkgrel=1
pkgdesc="Tixati is a peer-to-peer file sharing program that uses the popular BitTorrent protocol"
arch=('i686' 'x86_64')
url='http://www.tixati.com/'
license=('custom:tixati')
depends=('gtk3' 'hicolor-icon-theme' 'dbus-glib' 'traceroute')
optdepends=('gconf: for shell integration')
install='tixati.install'
source=('LICENSE')
source_i686=("https://download.tixati.com/$pkgname-${pkgver}-1.i686.manualinstall.tar.gz")
source_x86_64=("https://download.tixati.com/$pkgname-${pkgver}-1.x86_64.manualinstall.tar.gz")
sha256sums=('4b8bc7a9be3ad1300dd8e90cbf5af96a597379c3b994ee0793990fee3290c8d2')
sha256sums_i686=('f9e90dbfca4d319bf16d796dd8764aa01867f1a65629324a7f7d68e5854f75c4')
sha256sums_x86_64=('063a04c7a672469c3d38daf99c7fce28b4c136a8e755b204319d16b9e097241c')

package() {
  cd "$srcdir/$pkgname-${pkgver}-1.$CARCH.manualinstall"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
