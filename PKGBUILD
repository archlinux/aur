# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReactomeGraph4R
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Interface for the Reactome Graph Database'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-data.table
  r-doparallel
  r-foreach
  r-getpass
  r-jsonlite
  r-magrittr
  r-neo4r
  r-purrr
  r-reactomecontentservice4r
  r-rlang
)
optdepends=(
  r-knitr
  r-networkd3
  r-rmarkdown
  r-stringr
  r-testthat
  r-visnetwork
  r-wesanderson
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('73d1ab4a23497a83c68401163ae949b695c017344a3fddc8cf536efe7c95fa1e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
