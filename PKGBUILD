# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GladiaTOX
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
  r-rmysql
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
sha256sums=('7a42751eaf669b7e4ff137752825591e99137a7c6ee52920c932a6504ac54197')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
