# Maintainer: cyprus187 < cyprus187 AT noreply DOT archlinux DOT org>
# Contributor: FKonAUR <fkonaur at googlegroups dot com>
# Contributor: Amy Wilson <awils_1 at xsmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fopnu
pkgver=1.64
pkgrel=1
pkgdesc='A new and powerful P2P File Sharing System'
arch=('x86_64' 'i686')
url='https://www.fopnu.com'
license=('custom:fopnu')
depends=('gtk2' 'hicolor-icon-theme' 'dbus-glib')
optdepends=('gconf: for shell integration')
install='fopnu.install'
source=('LICENSE')
source_i686=("https://download2.fopnu.com/download/fopnu-1.64-1.i686.manualinstall.tar.gz")
source_x86_64=("https://download2.fopnu.com/download/fopnu-1.64-1.x86_64.manualinstall.tar.gz")
sha256sums=('0bc342f6415aa54c3d313af6a45152cb005024c7167d4fd0c71bfa004a2f8e4f')
sha256sums_i686=('d7325b52060ef12b04b4b68921e2e1a80d73101711598f004852081b5e27d781')
sha256sums_x86_64=('ce2c54716da4ff966f91e7b445d16c93901485f0121e839ae38ef99ecbaa3549')

package() {
  if [ "$CARCH" == "x86_64" ]
  then
    cd "$srcdir/$pkgname-${pkgver}-${pkgrel}.x86_64.manualinstall"
  fi

  if [ "$CARCH" == "i686" ]
  then
    cd "$srcdir/$pkgname-${pkgver}-${pkgrel}.i686.manualinstall"
  fi

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}