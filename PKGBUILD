# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epiR
_pkgver=2.0.56
pkgname=r-${_pkgname,,}
pkgver=2.0.56
pkgrel=1
pkgdesc='Tools for the Analysis of Epidemiological Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-biasedurn
  r-lubridate
  r-pander
  r-sf
  r-zoo
  r-flextable
  r-officer
)
optdepends=(
  r-foreign
  r-ggplot2
  r-knitr
  r-mapproj
  r-maptools
  r-mass
  r-plyr
  r-rcolorbrewer
  r-rgdal
  r-rgeos
  r-rmarkdown
  r-scales
  r-spatstat
  r-spdata
  r-tidyverse
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5824b7995dfd0477b9ca556a66a2b9470950c99fca2b814b8abd51505d6709f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
