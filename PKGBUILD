# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CIMICE
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
sha256sums=('01f61faed60ded7a50537d1c82d134326f47f076b2b356eb15c2e7f8e01a1c4c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
