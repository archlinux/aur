# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FEAST
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='FEAture SelcTion (FEAST) for Single-cell clustering'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-irlba
  r-matrixstats
  r-mclust
  r-sc3
  r-singlecellexperiment
  r-summarizedexperiment
  r-tscan
)
optdepends=(
  r-biocstyle
  r-ggpubr
  r-knitr
  r-rmarkdown
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0316c7e0f42f091d7d7b163e7face1357fed0b7b814e180649e8a5b95ac6157c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
