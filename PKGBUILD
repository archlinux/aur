# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mnem
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=3
pkgdesc='Mixture Nested Effects Models'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-e1071
  r-flexclust
  r-ggplot2
  r-graph
  r-linnorm
  r-matrixstats
  r-naturalsort
  r-rcpp
  r-rcppeigen
  r-rgraphviz
  r-snowfall
  r-tsne
  r-wesanderson
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-devtools
  r-epinem
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a959fd9868e0841aa35e88057fce03eaaf376782702293161f42693a10e7ef51')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
