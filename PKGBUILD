# Maintainer:
# Contributor: Nissar Chababy <funilrys at outlook dot com>
# Contributor: Jeroen Bollen <jbinero at gmail dot comau>

_pkgname="ckbcomp"
pkgname="$_pkgname"
pkgver=1.247
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
url="https://salsa.debian.org/installer-team/console-setup"
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('git')

_pkgsrc="console-setup-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/-/archive/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('b9b8a4df52d8062ce6b311262212da2faf959295a93b75df3d961a69608291e7')

package() {
  depends+=('perl')

  cd "$_pkgsrc"
  install -Dm755 Keyboard/ckbcomp -t "$pkgdir/usr/bin/"
}
