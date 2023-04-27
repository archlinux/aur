# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sevenbridges
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Seven Bridges Platform API Client and Common Workflow Language Tool Builder in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-curl
  r-data.table
  r-docopt
  r-httr
  r-jsonlite
  r-objectproperties
  r-s4vectors
  r-stringr
  r-uuid
  r-yaml
)
optdepends=(
  r-knitr
  r-readr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('000490d3ffa282e9f0a1dd9c5ea192c7f564cc23e8755e7bd4f712eba506d5eb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
