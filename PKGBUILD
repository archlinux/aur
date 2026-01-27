# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=FSA
_pkgver=0.10.1
pkgname=r-${_pkgname,,}
pkgver=0.10.1
pkgrel=1
pkgdesc='Simple Fisheries Stock Assessment Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-dunn.test
  r-flexparamcurve
  r-lmtest
  r-plotrix
  r-withr
)
optdepends=(
  r-covr
  r-desctools
  r-dplyr
  r-fishmethods
  r-fsadata
  r-knitr
  r-marked
  r-nlme
  r-nlstools
  r-pkgdown
  r-plyr
  r-psych
  r-rcapture
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0c427b44dbb193cd27820850e3cd4624f4f3f2c5d54f9fcaa885335e2e444573')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
