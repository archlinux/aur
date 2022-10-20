# Maintainer: klee <klee at fedora dot email>

_basename=mullvad-vpn
_svname=mullvad-daemon
pkgname=${_basename}-runit
pkgver=2022.5
pkgrel=1
pkgdesc="Runit init service for Mullvad Desktop App"
arch=('any')
url="https://codeberg.org/klee/mullvad-vpn-runit"
license=('aGPL-3.0-')
conflicts=()
source=("${_svname}.run")
sha256sums=('46c064f399853f8c9a60675f7fa71cc61a9259d1ae774c652596f1ef5a4db063')

package() {
  for x in run ; do
    install -Dm755 "$srcdir/${_svname}.${x}" "$pkgdir/etc/runit/sv/${_svname}/${x}"
  done
}
