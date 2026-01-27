# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=summarytools
_pkgver=1.1.5
pkgname=r-${_pkgname,,}
pkgver=1.1.5
pkgrel=1
pkgdesc='Tools to Quickly and Neatly Summarize Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-checkmate
  r-dplyr
  r-htmltools
  r-lubridate
  r-magick
  r-matrixstats
  r-pander
  r-pryr
  r-rapportools
  r-tibble
  r-tidyr
  tk
)
optdepends=(
  r-forcats
  r-formatr
  r-kableextra
  r-knitr
  r-magrittr
  r-rmarkdown
  r-rstudioapi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('457dbe0c2dd263d534a60290564ee4ba8e58f01c811c259a8751646fd653ed80')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
