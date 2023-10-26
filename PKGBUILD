# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcellminer
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=2.24.0
pkgrel=1
pkgdesc='rcellminer: Molecular Profiles, Drug Response, and Chemical Structures for the NCI-60 Cell Lines'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-ggplot2
  r-gplots
  r-rcellminerdata
  r-shiny
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-dosnow
  r-foreach
  r-glmnet
  r-heatmaply
  r-jsonlite
  r-knitr
  r-parallel
  r-rcolorbrewer
  r-rmarkdown
  r-sqldf
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5c6e2b6e3c5245b0e35871a4d8a8cbea692e68f159a10e5bad47348596095dc0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
