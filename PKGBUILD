# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scuttle
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Single-Cell RNA-Seq Analysis Utilities'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-biocgenerics
  r-biocparallel
  r-delayedarray
  r-genomicranges
  r-matrixgenerics
  r-rcpp
  r-s4arrays
  r-s4vectors
  r-singlecellexperiment
  r-sparsearray
  r-summarizedexperiment
)
makedepends=(
  r-assorthead
)
optdepends=(
  r-biocstyle
  r-delayedmatrixstats
  r-knitr
  r-rmarkdown
  r-scran
  r-scrnaseq
  r-sparsematrixstats
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ff1ddb9a62f4261ad41e51007ed19871f0418be88af3313a68d252bdd54be80e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
