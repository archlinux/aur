# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IntramiRExploreR
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('3f111689ae937ef64633c58a838a22a54049c3515b3ae77e439c51f4ded3442a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
