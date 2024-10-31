# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CONFESS
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Cell OrderiNg by FluorEScence Signal'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-changepoint
  r-contrast
  r-data.table
  r-ebimage
  r-ecp
  r-flexmix
  r-flowclust
  r-flowcore
  r-flowmeans
  r-flowmerge
  r-flowpeaks
  r-foreach
  r-ggplot2
  r-limma
  r-moments
  r-outliers
  r-plotrix
  r-raster
  r-readbitmap
  r-reshape2
  r-samspectral
  r-waveslim
  r-wavethresh
  r-zoo
)
optdepends=(
  r-biocstyle
  r-confessdata
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('11595c90356204a6556b4906eec07ef5496b399d6e56662806a40abca603a941')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
