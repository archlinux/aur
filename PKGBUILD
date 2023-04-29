# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=wrswoR
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Weighted Random Sampling without Replacement'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-logging
  r-rcpp
)
optdepends=(
  r-batchexperiments
  r-biocmanager
  r-dplyr
  r-ggplot2
  r-import
  r-kimisc
  r-knitcitations
  r-knitr
  r-metap
  r-microbenchmark
  r-rmarkdown
  r-roxygen2
  r-rticles
  r-sampling
  r-testthat
  r-tidyr
  r-tikzdevice
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('11045a62feef679bbcb02a0ede8a2c5985393df57f47b67da2733884116016e0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
