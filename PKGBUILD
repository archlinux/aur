# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=benchmarkme
_pkgver=1.0.7
pkgname=r-${_pkgname,,}
pkgver=1.0.7
pkgrel=4
pkgdesc='Crowd Sourced System Benchmarks'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-benchmarkmedata
  r-doparallel
  r-dplyr
  r-foreach
  r-httr
  r-tibble
)
optdepends=(
  r-covr
  r-dt
  r-ggplot2
  r-knitr
  r-rcppziggurat
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('37999b9e2df46dc274ad8aafd2b1c722d099e9680938c780defeda9d7fd7af7a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
