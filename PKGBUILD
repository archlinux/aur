# system requirements: Perl
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ModCon
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Modifying splice site usage by changing the mRNP code, while maintaining the genetic code'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  perl
)
optdepends=(
  r-dplyr
  r-knitr
  r-rmarkdown
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinyfiles
  r-shinyjs
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9094b95ceb21fbfc3b70b596363dc5efab1645de86732c17fa1da88a8fab1cf2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
