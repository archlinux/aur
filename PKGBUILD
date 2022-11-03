# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scBFA
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='A dimensionality reduction tool using gene detection pattern to mitigate noisy expression profile of scRNA-seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-copula
  r-deseq2
  r-ggplot2
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-zinbwave
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rtsne
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ce2248ae11236f932eea6210560ee882cd1b8f51c6389eae707e18a568d20421')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
