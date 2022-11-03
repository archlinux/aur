# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mAPKL
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='A Hybrid Feature Selection method for gene expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-apcluster
  r-biobase
  r-clustersim
  r-e1071
  r-igraph
  r-limma
  r-multtest
  r-parmigene
  r-reactome.db
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-hgu133plus2.db
  r-knitr
  r-mapkldata
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1aed8e328ff76451d5ff58f95e526871da121b5ce66a91154d415fd948c9425a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
