# Maintainer: aur.chaotic.cx
# Contributor: Nissar Chababy <funilrys at outlook dot com>
# Contributor: Jeroen Bollen <jbinero at gmail dot comau>

_pkgname="ckbcomp"
pkgname="$_pkgname"
pkgver=1.248
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
url="https://salsa.debian.org/installer-team/console-setup"
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('git')

_pkgsrc="console-setup-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/-/archive/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('55b27b3da435b43fc4dda66140fe7729bd47a6424829e78a9b4ec85ced532eac')

package() {
  depends+=('perl')

  cd "$_pkgsrc"
  install -Dm755 Keyboard/ckbcomp -t "$pkgdir/usr/bin/"
}
