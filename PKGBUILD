# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TOAST
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Tools for the analysis of heterogeneous tissues'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-corpcor
  r-doparallel
  r-epidish
  r-ggally
  r-ggplot2
  r-limma
  r-nnls
  r-quadprog
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
  r-matrix
  r-matrixstats
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('99dcb6abe190060c636ee8926fd8d41f09eba7edbfffd533b4c5a8547eea326b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
