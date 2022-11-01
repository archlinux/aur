# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=contrast
_pkgver=0.24.2
pkgname=r-${_pkgname,,}
pkgver=0.24.2
pkgrel=1
pkgdesc='A Collection of Contrast Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rms
  r-sandwich
)
optdepends=(
  r-covr
  r-dplyr
  r-geepack
  r-ggplot2
  r-kableextra
  r-knitr
  r-rmarkdown
  r-splines
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4541acae0f18906c960141b6aafa3eaaa2451efdf7a50952cd83ebf7ab6cefcc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
