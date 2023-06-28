# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsPTM
_pkgver=2.2.4
pkgname=r-${_pkgname,,}
pkgver=2.2.4
pkgrel=1
pkgdesc='Statistical Characterization of Post-translational Modifications'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-checkmate
  r-data.table
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-msstats
  r-msstatsconvert
  r-msstatstmt
  r-rcpp
  r-stringi
  r-stringr
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('803289d73b921db44873eff99506bb9109a8b62363c57045ec397d19f8e54a11')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
