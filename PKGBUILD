# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ClusterSignificance
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='The ClusterSignificance package provides tools to assess if class clusters in dimensionality reduced data representations have a separation different from permuted data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-pracma
  r-princurve
  r-rcolorbrewer
  r-scatterplot3d
)
optdepends=(
  r-biocstyle
  r-covr
  r-ggplot2
  r-knitr
  r-plsgenomics
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ed55d9f255b77a302108b60e0e1651a03ebcce43fbd191b5d449789fbd98f1c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
