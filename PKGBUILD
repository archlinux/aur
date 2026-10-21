# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=openscad-bosl2
_pkgname=BOSL2
pkgver=2.0.776
pkgrel=1
pkgdesc="The Belfry OpenSCAD Library v2.0"
arch=('any')
url="https://github.com/BelfrySCAD/BOSL2"
license=('BSD-2-Clause')
depends=('openscad')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('836bba5f6dab9d4fed7fd0a2443ce757273eabd889470bc660547ddc7e0da124')

package() {
  cd "${_pkgname}-${pkgver}"

  local _libdir="usr/share/openscad/libraries/${_pkgname}"
  local _docdir="usr/share/doc/${pkgname}"

  # library
  install -vDm644 -t "${pkgdir}/${_libdir}" ./*.scad
  install -vDm644 -t "${pkgdir}/${_libdir}/examples" examples/*.scad

  # documentation
  install -vDm644 -t "${pkgdir}/${_docdir}" README.md
  install -vDm644 -t "${pkgdir}/${_docdir}/tutorials" tutorials/*.md

  # license
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
