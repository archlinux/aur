# Maintainer: klee <klee at fedora dot email>

_basename=mullvad-vpn
_svname=mullvad-daemon
pkgname=${_basename}-runit
pkgver=2022.5
pkgrel=2
pkgdesc="Runit init service for Mullvad Desktop App"
arch=('any')
url="https://codeberg.org/klee/mullvad-vpn-runit"
license=('aGPL-3.0-')
conflicts=()
source=("${_svname}.run")
sha256sums=('6eca1d9c724fdf548bc8c73962b3a96f6c8ded5c4992fd17913d4ddb2a330d12')

package() {
  for x in run ; do
    install -Dm755 "$srcdir/${_svname}.${x}" "$pkgdir/etc/runit/sv/${_svname}/${x}"
  done
}
