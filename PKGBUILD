# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IntramiRExploreR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Predicting Targets for Drosophila Intragenic miRNAs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-fgnet
  r-igraph
  r-knitr
)
optdepends=(
  r-gprofiler
  r-org.dm.eg.db
  r-rmarkdown
  r-testthat
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aafcbba1ec0148033fc5f9858b800fdc3451a2743f858d3f9155ef1a7671cbd0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
