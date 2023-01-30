# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flextable
_pkgver=0.8.5
pkgname=r-${_pkgname,,}
pkgver=0.8.5
pkgrel=1
pkgdesc='Functions for Tabular Reporting'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-data.table
  r-gdtools
  r-htmltools
  r-knitr
  r-officer
  r-rlang
  r-rmarkdown
  r-uuid
  r-xml2
)
optdepends=(
  r-bookdown
  r-broom
  r-broom.mixed
  r-cluster
  r-commonmark
  r-doconv
  r-equatags
  r-ggplot2
  r-lme4
  r-locatexec
  r-magick
  r-mgcv
  r-nlme
  r-officedown
  r-pdftools
  r-scales
  r-testthat
  r-webshot
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b6a59a4a7a1ad40d6cb22289bf17a205a023bde8a9e95423c63d12f032519db0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
