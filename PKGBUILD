# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spacetime
_pkgver=1.3-2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
pkgrel=1
pkgdesc='Classes and Methods for Spatio-Temporal Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-intervals
  r-sp
  r-xts
  r-zoo
)
optdepends=(
  r-adehabitatlt
  r-cshapes
  r-foreign
  r-googlevis
  r-gstat
  r-isocodes
  r-knitr
  r-mapdata
  r-maps
  r-markdown
  r-plm
  r-raster
  r-rcolorbrewer
  r-rmarkdown
  r-rpostgresql
  r-sf
  r-sftime
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d6819eb7162b65638a5faad77a102cb8fb5934a5a19d02b6acfbd4e3128cbb05')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
