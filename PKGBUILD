# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=variancePartition
_pkgver=1.28.3
pkgname=r-${_pkgname,,}
pkgver=1.28.3
pkgrel=1
pkgdesc='Quantify and interpret divers of variation in multilevel gene expression experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aod
  r-biobase
  r-biocparallel
  r-doparallel
  r-foreach
  r-ggplot2
  r-gplots
  r-iterators
  r-limma
  r-lme4
  r-lmertest
  r-pbkrtest
  r-progress
  r-rdpack
  r-remacor
  r-reshape2
  r-rhpcblasctl
  r-rlang
  r-scales
)
optdepends=(
  r-ballgown
  r-biocgenerics
  r-biocstyle
  r-dendextend
  r-deseq2
  r-edger
  r-knitr
  r-pander
  r-r2glmm
  r-readr
  r-rmarkdown
  r-runit
  r-tximport
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('654dbc266f6ffc1a48b6675c7c28c02f9824b1d45ab4bd0c9c2b367feec14def')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
