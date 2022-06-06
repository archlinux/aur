# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tscR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='A time series clustering package combining slope and Frechet distances'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-dtw
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-iranges
  r-kmlshape
  r-knitr
  r-latex2exp
  r-prettydoc
  r-rcolorbrewer
  r-rmarkdown
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('51c298e18153c46c78db2132ddb4ac81b60b2d4a9df45580dc2b8dd6d3380d45')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
