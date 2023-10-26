# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnem
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Training of logical models from indirect measurements of perturbation experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-binom
  r-biobase
  r-cellnoptr
  r-epinem
  r-flexclust
  r-graph
  r-limma
  r-matrixstats
  r-mnem
  r-rcolorbrewer
  r-rgraphviz
  r-rmarkdown
  r-snowfall
  r-sva
  r-vsn
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-matrixgenerics
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba3014cf2a72af41a66cc61a1cb35c7b755bf3c69205d866b0258cd697c98572')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
