# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnMCB
_pkgver=1.8.2
pkgname=r-${_pkgname,,}
pkgver=1.8.2
pkgrel=4
pkgdesc='Predicting Disease Progression Based on Methylation Correlated Blocks using Ensemble Models'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-foreach
  r-ggplot2
  r-glmnet
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-mboost
  r-minfi
  r-rms
  r-survivalroc
  r-survivalsvm
  r-igraph
)
optdepends=(
  r-affycoretools
  r-biobase
  r-knitr
  r-plotroc
  r-prognosticroc
  r-rmarkdown
  r-summarizedexperiment
  r-survminer
  r-testthat
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('847b4ad1e11d292f898f5221fc4f54bba9f8d5cf1530be8f54b4969f893ecace')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
