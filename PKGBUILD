# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mnem
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
  r-devtools
  r-epinem
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('00ddd7ab83580a260a08da3ee7013e7aa069ecd734197bf5d202f77dd4378c13')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
