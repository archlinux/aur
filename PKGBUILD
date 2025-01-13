# Maintainer: envolution
# Contributor: cyprus187 < cyprus187 AT noreply DOT archlinux DOT org>
# Contributor: FKonAUR <fkonaur at googlegroups dot com>
# Contributor: Amy Wilson <awils_1 at xsmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fopnu
pkgver=1.67+1
_pkgver=${pkgver/+/-}
pkgrel=1
pkgdesc='A new and powerful P2P File Sharing System'
arch=('x86_64' 'i686')
url='https://www.fopnu.com'
license=('LicenseRef-custom')
depends=('gtk3' 'hicolor-icon-theme' 'dbus-glib')
optdepends=('gconf: for shell integration')
source=('LICENSE')
source_i686=("https://download2.fopnu.com/download/fopnu-${_pkgver}.i686.manualinstall.tar.gz")
source_x86_64=("https://download2.fopnu.com/download/fopnu-${_pkgver}.x86_64.manualinstall.tar.gz")
sha256sums=('0bc342f6415aa54c3d313af6a45152cb005024c7167d4fd0c71bfa004a2f8e4f')
sha256sums_x86_64=('3bcc267fefe6a08665c597eaa337ed584001411d2a3dbc38d5eac2c5f995dcc7')
sha256sums_i686=('e1f8fa13a44f85e6f09ec088cc94578dd2ba52a955dfa00fd2861364fe700146')

package() {
  cd "$pkgname-${_pkgver}.${CARCH}.manualinstall"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $srcdir/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
