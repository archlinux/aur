# Maintainer: envolution
# Contributor: cyprus187 < cyprus187 AT noreply DOT archlinux DOT org>
# Contributor: FKonAUR <fkonaur at googlegroups dot com>
# Contributor: Amy Wilson <awils_1 at xsmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fopnu
pkgver=1.68+1
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
sha256sums_x86_64=('abe9c8d2ce33bbaf8bafca5d13247cff33a4ab950bc9d62dd9b9edbf3c9a959a')
sha256sums_i686=('e7f06d2363671c9a513684e0c9e7139bafcc1c15924a5c62dbce8ec85aebe3ec')

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
