# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NormalyzerDE
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Evaluation of normalization methods and calculation of differential expression analysis statistics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-biobase
  r-car
  r-ggforce
  r-ggplot2
  r-limma
  r-matrixstats
  r-preprocesscore
  r-raster
  r-rcmdrmisc
  r-summarizedexperiment
  r-vsn
)
optdepends=(
  r-biocstyle
  r-hexbin
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ec8bd8121b312a612a7a22427ed2daaa196d583a3ac96be52c5c8b918948153a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
