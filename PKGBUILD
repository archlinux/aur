# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fgsea
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=3
pkgdesc='Fast Gene Set Enrichment Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  gcc
  r
  r-bh
  r-biocparallel
  r-cowplot
  r-data.table
  r-fastmatch
  r-ggplot2
  r-rcpp
  r-scales
)
optdepends=(
  r-aggregation
  r-annotationdbi
  r-geoquery
  r-knitr
  r-limma
  r-msigdbr
  r-org.mm.eg.db
  r-parallel
  r-reactome.db
  r-rmarkdown
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ffd44dcf4e4a757ae4c79f3df99897a3e126fbca3e54457ace2c8cc923cf1632')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
