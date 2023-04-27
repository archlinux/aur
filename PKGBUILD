# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bayNorm
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Single-cell RNA sequencing data normalization'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bb
  r-biocparallel
  r-dosnow
  r-fitdistrplus
  r-foreach
  r-iterators
  r-locfit
  r-rcpp
  r-rcpparmadillo
  r-rcppprogress
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0e6ef5edfe5c2a797f4dba9bb2279636d9bd63671268845acf8d4974cde9d324')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
