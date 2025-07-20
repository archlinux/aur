# Maintainer:
# Contributor: Nissar Chababy <funilrys at outlook dot com>
# Contributor: Jeroen Bollen <jbinero at gmail dot comau>

_pkgname="ckbcomp"
pkgname="$_pkgname"
pkgver=1.240
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
url="https://salsa.debian.org/installer-team/console-setup"
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('git')

_pkgsrc="console-setup"
source=("$_pkgsrc"::"git+$url.git#commit=$pkgver")
sha256sums=('89583e56bda72426f514bdd70f4d7567576457f327214d3da6e171b85a7f63e7')

package() {
  depends+=('perl')

  cd "$_pkgsrc"
  install -Dm755 Keyboard/ckbcomp -t "$pkgdir/usr/bin/"
}
