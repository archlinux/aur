# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=airpart
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Differential cell-type-specific allelic imbalance'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-apeglm
  r-clue
  r-complexheatmap
  r-dplyr
  r-dynamictreecut
  r-emdbook
  r-forestplot
  r-ggplot2
  r-lpsolve
  r-matrixstats
  r-mclust
  r-pbapply
  r-plyr
  r-rcolorbrewer
  r-rlang
  r-s4vectors
  r-scater
  r-singlecellexperiment
  r-smurf
  r-summarizedexperiment
)
optdepends=(
  r-gplots
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('402e967c5ba3a3f0e1ff2402c91abf8d4288ff8811678d98f634c7215c679b08')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
