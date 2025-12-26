# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=FSA
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=0.10.0
pkgrel=2
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
sha256sums=('0790488b979e39b69edd9b0cba9525a35915d3e8019e6c9778b6e62c3979b541')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
