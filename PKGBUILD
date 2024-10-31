# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GladiaTOX
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='R Package for Processing High Content Screening data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-brew
  r-data.table
  r-dbi
  r-ggplot2
  r-ggrepel
  r-numderiv
  r-rcolorbrewer
  r-rcurl
  r-rjsonio
  r-rmariadb
  r-rsqlite
  r-stringr
  r-tidyr
  r-xml
  r-xtable
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3282cb55d3cb4b6f1567c58dc602d6662ab602804b44ae2a6a01635e26c759a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
