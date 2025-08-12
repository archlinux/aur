# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=brlcad-bin
_pkgname=brlcad
pkgver=7.42.0
pkgrel=1
pkgdesc='An extensive 3D solid modeling system. Binary package'
url='https://brlcad.org'
license=('LGPL-2.1-only' 'BSD-3-Clause' 'LicenseRef-BDL')
arch=('x86_64')
depends=('libgl' 'libxft' 'libxi')
options=(!strip !debug)
provides=(brlcad)
conflicts=(brlcad)
install="${_pkgname}.install"
_tag_name="rel-${pkgver//./-}"
source=(
  "https://github.com/BRL-CAD/${_pkgname}/releases/download/${_tag_name}/BRL-CAD_${pkgver}_Linux_${CARCH}.tar.bz2"
)
sha256sums=('76badb24723020b13975f999c855062d3b8c0b76be5e165ef68ce3044ae0f653')

package() {
  cd BRL-CAD_${pkgver}_Linux_${CARCH}
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a * "$pkgdir/opt/$_pkgname/"
}
# vim:set ts=2 sw=2 et:
