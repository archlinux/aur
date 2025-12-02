# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mnem
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
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
sha256sums=('880c8684b7358b01e9724e7f35dca8d790655a038ed8008c0159b83f475f3233')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
