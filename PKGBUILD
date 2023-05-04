# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bench
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=1.1.3
pkgrel=1
pkgdesc='High Precision Timing of R Expressions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-glue
  r-pillar
  r-profmem
  r-rlang
  r-tibble
)
optdepends=(
  r-covr
  r-dplyr
  r-forcats
  r-ggbeeswarm
  r-ggplot2
  r-ggridges
  r-jsonlite
  r-mockery
  r-parallel
  r-scales
  r-testthat
  r-tidyr
  r-vctrs
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bfae6320ad8c0c84fa6832519fac0e783e8d3ac5e3019ff6526f8060e8f1f317')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
