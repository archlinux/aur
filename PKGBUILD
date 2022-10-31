# Maintainer: klee <klee at fedora dot email>

_basename=mullvad-vpn
_svname=mullvad-daemon
pkgname=${_basename}-runit
pkgver=20221031
pkgrel=1
pkgdesc="Runit init service for Mullvad Desktop App"
arch=('any')
url="https://codeberg.org/klee/mullvad-vpn-runit"
license=('AGPL3')
conflicts=()
source=("${_svname}.run")
sha512sums=('31467f9ecffe182ec8925a54c13dbf378a80fda35fdacd76477836b9d7a4e990bf51346dfa1e71e5bd8616236873f45fa2eacec2ab907ee8d079275098b109c4')

package() {
  for x in run ; do
    install -Dm755 "$srcdir/${_svname}.${x}" "$pkgdir/etc/runit/sv/${_svname}/${x}"
  done
}
