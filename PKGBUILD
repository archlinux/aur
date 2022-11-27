# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ClassifyR
_pkgver=3.2.3
pkgname=r-${_pkgname,,}
pkgver=3.2.3
pkgrel=1
pkgdesc='A framework for cross-validated classification problems, with applications to differential variability and differential distribution testing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-dplyr
  r-genefilter
  r-generics
  r-multiassayexperiment
  r-ranger
  r-rlang
  r-s4vectors
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-car
  r-class
  r-cowplot
  r-e1071
  r-edger
  r-ggplot2
  r-glmnet
  r-gridextra
  r-gtable
  r-htmltools
  r-iranges
  r-knitr
  r-limma
  r-matrixmodels
  r-pamr
  r-parathyroidse
  r-poiclaclu
  r-randomforestsrc
  r-rmarkdown
  r-rmixmod
  r-robustbase
  r-scales
  r-xgboost
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3ecdf4ce6241687867f6d6159da6e874663d2205f8517e99c02d16976da047ee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
