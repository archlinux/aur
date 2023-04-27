# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GWENA
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Pipeline for augmented co-expression analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-dynamictreecut
  r-ggplot2
  r-gprofiler2
  r-igraph
  r-magrittr
  r-matrixstats
  r-netrep
  r-purrr
  r-rcolorbrewer
  r-rlist
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-httr
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-s4vectors
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5671bbde20ca0bf48064bc33d3bc3f9593be37ba77db789cd22acc863de1686')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
