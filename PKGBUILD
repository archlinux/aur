# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pairkat
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='PaIRKAT'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-compquadform
  r-data.table
  r-igraph
  r-keggrest
  r-magrittr
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2d1a5d40ca9f6a5d0d609a97a0d67d5e615834ec649714bf8128b04a2d72bce7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
