# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=FSA
_pkgver=0.9.5
pkgname=r-${_pkgname,,}
pkgver=0.9.5
pkgrel=1
pkgdesc='Simple Fisheries Stock Assessment Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-dunn.test
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
sha256sums=('e08db2986b84ef84c93a160c34e0bd1b7fa12d92863e464234edc50375702f2d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
