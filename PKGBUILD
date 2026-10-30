# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=openscad-bosl2
_pkgname=BOSL2
pkgver=2.0.782
pkgrel=1
pkgdesc="The Belfry OpenSCAD Library v2.0"
arch=('any')
url="https://github.com/BelfrySCAD/BOSL2"
license=('BSD-2-Clause')
depends=('openscad')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('87306760fe36ca4a6c353ce9e38680ea59ee2f017a7c3331eebbc4a6696e37a6')

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
