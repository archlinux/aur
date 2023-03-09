# system requirements: ghostscript
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grImport
_pkgver=0.9-7
pkgname=r-${_pkgname,,}
pkgver=0.9.7
pkgrel=1
pkgdesc='Importing Vector Graphics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-xml
  ghostscript
)
optdepends=(
  r-cluster
  r-colorspace
  r-lattice
  r-survival
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('05f8b65a55c5fabce2afb74c2b843f5df772d1f931d1ba3ce5f3bfe0493cd0a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
