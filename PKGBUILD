# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SummarizedBenchmark
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=1
pkgdesc='Classes and methods for performing benchmark comparisons'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-crayon
  r-digest
  r-dplyr
  r-ggplot2
  r-mclust
  r-rlang
  r-s4vectors
  r-sessioninfo
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-upsetr
)
optdepends=(
  r-biocstyle
  r-biomart
  r-deseq2
  r-edger
  r-icobra
  r-ihw
  r-knitr
  r-limma
  r-magrittr
  r-qvalue
  r-readr
  r-rmarkdown
  r-rnaseqcomp
  r-scater
  r-scrnaseq
  r-splatter
  r-testthat
  r-tximport
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8eb2a20cfe31df95ed3d9c6c14a5b3611a94b082dbc1ef04b248f2e1caaa8313')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
