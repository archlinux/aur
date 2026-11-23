# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flextable
_pkgver=0.10.5
pkgname=r-${_pkgname,,}
pkgver=0.10.5
pkgrel=1
pkgdesc='Functions for Tabular Reporting'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-gdtools
  r-htmltools
  r-knitr
  r-officer
  r-ragg
  r-rlang
  r-rmarkdown
  r-uuid
  r-xml2
)
optdepends=(
  r-bookdown
  r-broom
  r-broom.mixed
  r-chromote
  r-cluster
  r-commonmark
  r-doconv
  r-equatags
  r-formatters
  r-ggplot2
  r-gtable
  r-jsonlite
  r-lme4
  r-magick
  r-mgcv
  r-nlme
  r-officedown
  r-patchwork
  r-pdftools
  r-pkgdown
  r-rtables
  r-scales
  r-svglite
  r-tables
  r-testthat
  r-webshot2
  r-withr
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f9a754438041fe9e95e77b323b2789c0606cc156694e1c072ac282c2e6c0572e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
