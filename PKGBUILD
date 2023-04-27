# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Linnorm
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=2.24.0
pkgrel=1
pkgdesc='Linear model and normality based normalization and transformation method (Linnorm)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-amap
  r-apcluster
  r-ellipse
  r-fastcluster
  r-fpc
  r-ggdendro
  r-ggplot2
  r-gmodels
  r-igraph
  r-limma
  r-mclust
  r-rcpp
  r-rcpparmadillo
  r-rtsne
  r-statmod
  r-vegan
  r-zoo
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
  r-markdown
  r-moments
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4f62751f8634950d6d7d3cfd9176d9ebfb66eafe607dc0bbd8f7402f34e73344')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
