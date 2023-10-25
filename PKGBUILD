# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneplast
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Evolutionary and plasticity analysis of orthologous groups'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-data.table
  r-igraph
  r-snow
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-fletcher2013b
  r-geneplast.data
  r-geneplast.data.string.v91
  r-ggplot2
  r-ggpubr
  r-knitr
  r-plyr
  r-rmarkdown
  r-rtn
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c215014d77c3f315c47e99ee2309243353a6c78b294928ebb163a52e8ae1e283')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
