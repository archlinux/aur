# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FindIT2
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='find influential TF and Target based on multi-omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-glmnet
  r-iranges
  r-multiassayexperiment
  r-patchwork
  r-progress
  r-purrr
  r-qvalue
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-withr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-txdb.athaliana.biomart.plantsmart28
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83c840af62b4b93092844a699db27ee63dc9027b8a2cbbe27c19e948f0d8f718')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
