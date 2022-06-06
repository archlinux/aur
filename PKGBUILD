# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dplR
_pkgver=1.7.2
pkgname=r-${_pkgname,,}
pkgver=1.7.2
pkgrel=4
pkgdesc='Dendrochronology Program Library in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-matrixstats
  r-plyr
  r-png
  r-r.utils
  r-signal
  r-stringi
  r-stringr
  r-xml
)
optdepends=(
  r-biobase
  r-cairo
  r-dichromat
  r-foreach
  r-forecast
  r-gmp
  r-iterators
  r-knitr
  r-rcolorbrewer
  r-testthat
  r-tikzdevice
  r-waveslim
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41a9357e198a312cb6029197a0c7f60a38eabf6d78060a4c376c6cdee357a7bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
