# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnem
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af71b22fd8545ab92a9c72e748221578959ccc7e7476fc8e2f72363cd4d25f96')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
