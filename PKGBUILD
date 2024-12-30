# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=brlcad-bin
_pkgname=brlcad
pkgver=7.40.2
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
sha256sums=('fbfb17dd68ec9066f262473bd984412b5ccc3e9bd57893f7348eae2030aa020e')

package() {
  cd BRL-CAD_${pkgver}_Linux_${CARCH}
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a * "$pkgdir/opt/$_pkgname/"
}
# vim:set ts=2 sw=2 et:
