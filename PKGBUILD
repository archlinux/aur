# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnem
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
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
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('270490176c99c7a92cd09fb85987537c04bef1de8065f9a1dca36024a1b0fd6c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
