# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ClusterSignificance
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('2401e2c5911cdf942c2f1d771257ef8536875d2c074781dad67fff54cd12dccb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
