# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scClassify
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='scClassify: single-cell Hierarchical Classification'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-cepo
  r-diptest
  r-ggplot2
  r-ggraph
  r-hopach
  r-igraph
  r-limma
  r-minpack.lm
  r-mixtools
  r-proxy
  r-proxyc
  r-s4vectors
  r-statmod
)
optdepends=(
  r-biocstyle
  r-knitr
  r-pkgdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6ed52ca8d4839c48a9812b752350865ba0c793382b44289e04a26037b22b84c6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
