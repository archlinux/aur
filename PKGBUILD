# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Nebulosa
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Single-Cell Data Visualisation Using Kernel Gene-Weighted Density Estimation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-ks
  r-patchwork
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-covr
  r-dropletutils
  r-igraph
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-seuratobject
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d00e19082313fb5be93ad7cf983345e7d91eb378728ad89286b075555d4d1553')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
