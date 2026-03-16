# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=Rpdb
_pkgver=2.4.3
pkgname=r-${_pkgname,,}
pkgver=2.4.3
pkgrel=1
pkgdesc='Read, Write, Visualize and Manipulate PDB Files'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('68a67df7418ebb4d0a803142cdd7e504715ad3b12bb5a6f3ed93ccc4c37070a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
