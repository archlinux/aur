# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IntramiRExploreR
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('d8b0264bf48da611c6bc0e17fe1466ab8e59e27c6ccbeff7bf765b48a721823f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
