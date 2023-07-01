# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epiR
_pkgver=2.0.62
pkgname=r-${_pkgname,,}
pkgver=2.0.62
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
  r-dplyr
  r-foreign
  r-ggplot2
  r-knitr
  r-mapproj
  r-mass
  r-plyr
  r-rcolorbrewer
  r-rgeos
  r-rmarkdown
  r-scales
  r-sp
  r-spatstat
  r-spdata
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e93eb6647190a933f8ee3536cdfbd924e9b71ee3cf1d54ff4fd152e88e3fac48')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
