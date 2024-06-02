# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dplR
_pkgver=1.7.7
pkgname=r-${_pkgname,,}
pkgver=1.7.7
pkgrel=1
pkgdesc='Dendrochronology Program Library in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-matrixstats
  r-plyr
  r-png
  r-r.utils
  r-signal
  r-stringi
  r-stringr
  r-xml
)
optdepends=(
  r-cairo
  r-dichromat
  r-foreach
  r-forecast
  r-gmp
  r-iterators
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
  r-tikzdevice
  r-waveslim
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0e35a4d2a22773499f9e4592d1a198a08c9842388ce1e5a35394990ed4cdb2bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
