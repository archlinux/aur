# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CIMICE
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='CIMICE-R: (Markov) Chain Method to Inferr Cancer Evolution'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-assertthat
  r-dplyr
  r-expm
  r-ggcorrplot
  r-ggplot2
  r-ggraph
  r-glue
  r-igraph
  r-maftools
  r-networkd3
  r-purrr
  r-tidygraph
  r-tidyr
  r-visnetwork
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-webshot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('00600df1cf81868825c58b1ab34b7986fd283bc3b8a93bb1852d855a34ce6bf7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
