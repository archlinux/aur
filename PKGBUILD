# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowGraph
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Identifying differential cell populations in flow cytometry data accounting for marker frequency'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-effsize
  r-furrr
  r-future
  r-ggiraph
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-htmlwidgets
  r-igraph
  r-matrixstats
  r-purrr
  r-rdpack
  r-stringi
  r-stringr
  r-visnetwork
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df22e8d5cc64deaad2ad5ce74032ff9b05ecba187ee8570a817efc8d4bc856ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
