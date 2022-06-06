# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=neo4r
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=0.1.1
pkgrel=4
pkgdesc="A 'Neo4J' Driver"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-attempt
  r-data.table
  r-glue
  r-httr
  r-igraph
  r-jsonlite
  r-magrittr
  r-purrr
  r-r6
  r-rlang
  r-rstudioapi
  r-shiny
  r-tibble
  r-tidyr
  r-tidyselect
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47e5f51c6980a9383befc8247a5cdee708d60652e4908b2e510cb12a2c949968')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
