# Maintainer:
# Contributor: Nissar Chababy <funilrys at outlook dot com>
# Contributor: Jeroen Bollen <jbinero at gmail dot comau>

_pkgname="ckbcomp"
pkgname="$_pkgname"
pkgver=1.243
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
url="https://salsa.debian.org/installer-team/console-setup"
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('git')

_pkgsrc="console-setup-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/-/archive/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('a03032f2c4df52e4be8780470485d5f6320cbf6f43e4f87abeca360c9f5ee315')

package() {
  depends+=('perl')

  cd "$_pkgsrc"
  install -Dm755 Keyboard/ckbcomp -t "$pkgdir/usr/bin/"
}
