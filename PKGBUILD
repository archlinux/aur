# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=3.19
pkgrel=1
pkgdesc="Tixati is a peer-to-peer file sharing program that uses the popular BitTorrent protocol"
arch=('i686' 'x86_64')
url='http://www.tixati.com/'
license=('custom:tixati')
depends=('gtk2' 'hicolor-icon-theme' 'dbus-glib' 'traceroute')
optdepends=('gconf: for shell integration')
install='tixati.install'
source=('LICENSE')
source_i686=("https://download2.tixati.com/download/$pkgname-${pkgver}-1.i686.manualinstall.tar.gz")
source_x86_64=("https://download2.tixati.com/download/$pkgname-${pkgver}-1.x86_64.manualinstall.tar.gz")
sha256sums=('4b8bc7a9be3ad1300dd8e90cbf5af96a597379c3b994ee0793990fee3290c8d2')
sha256sums_i686=('718e405ffa69742a5573dc0f21b8289e6b60c82e0f97a7d3f0b36a23b53664f9')
sha256sums_x86_64=('d33757f964059c8aaf590422ca7f78478650e9ecbaf5eb4b4bd69fb40d64afc4')

package() {
  cd "$srcdir/$pkgname-${pkgver}-1.$CARCH.manualinstall"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
