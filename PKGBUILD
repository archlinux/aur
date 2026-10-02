# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=openscad-bosl2
_pkgname=BOSL2
pkgver=2.0.766
pkgrel=1
pkgdesc="The Belfry OpenSCAD Library v2.0"
arch=('any')
url="https://github.com/BelfrySCAD/BOSL2"
license=('BSD-2-Clause')
depends=('openscad')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('abc156f23ade68a26f6e49ba86b9fd829dd39407bec29cbc7f6773d746b248ba')

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
