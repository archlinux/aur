# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=spatstat.explore
_pkgver=3.6-0
pkgname=r-${_pkgname,,}
pkgver=3.6.0
pkgrel=1
pkgdesc="Exploratory Data Analysis for the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-goftest
  r-spatstat.data
  r-spatstat.geom
  r-spatstat.random
  r-spatstat.sparse
  r-spatstat.utils
)
optdepends=(
  r-fftwtools
  r-gsl
  r-locfit
  r-sm
  r-spatial
  r-spatstat
  r-spatstat.linnet
  r-spatstat.model
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3354ef4eecec42e2fe88589a9c21e091f16f6db4821151c73f5321d34fe47b71')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
