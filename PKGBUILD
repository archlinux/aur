# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datawizard
_pkgver=0.6.5
pkgname=r-${_pkgname,,}
pkgver=0.6.5
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
sha256sums=('eb5124e77f48b49c1f990442df356d528938e389b4a78f75cc9c50e4eb468946')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
