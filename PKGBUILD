# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datawizard
_pkgver=0.8.0
pkgname=r-${_pkgname,,}
pkgver=0.8.0
pkgrel=1
pkgdesc='Easy Data Wrangling'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-insight
)
optdepends=(
  r-bayestestr
  r-boot
  r-brms
  r-data.table
  r-dplyr
  r-effectsize
  r-gamm4
  r-ggplot2
  r-gt
  r-haven
  r-htmltools
  r-httr
  r-knitr
  r-lme4
  r-mediation
  r-parameters
  r-poorman
  r-psych
  r-readr
  r-readxl
  r-rio
  r-rmarkdown
  r-rstanarm
  r-see
  r-testthat
  r-tidyr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('13a3ed4f36157b18955dcbcb5a1f81a0d913349312cd44141f0afde16a3d22a2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
