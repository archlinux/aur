# Maintainer: klee <klee at fedora dot email>

_basename=mullvad-vpn
_svname=mullvad-daemon
pkgname=${_basename}-runit
pkgver=20221106
pkgrel=1
pkgdesc="Runit init service for Mullvad Desktop App"
arch=('any')
url="https://gitlab.eientei.org/klee/mullvad-vpn-runit"
license=('AGPL3')
conflicts=()
source=("${_svname}.run")
sha512sums=('c4d1bcf264fa2c7d4f90d85b5258b0df6d58ab76f523ab577c089f6ffe7b2b89074fbb8cb5719e80e030d427c373468f3ec42a7c82cabef22c157febcbb638de')

package() {
  for x in run ; do
    install -Dm755 "$srcdir/${_svname}.${x}" "$pkgdir/etc/runit/sv/${_svname}/${x}"
  done
}
