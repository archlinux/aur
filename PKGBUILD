# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRanslatome
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Comparison between multiple levels of gene expression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-anota
  r-biobase
  r-deseq2
  r-edger
  r-gosemsim
  r-gplots
  r-heatplus
  r-limma
  r-org.hs.eg.db
  r-plotrix
  r-rankprod
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('980b4c067cc41cea8aac711c02cd4a4a6ef6a778cf6fac042c9cb75647d6fd90')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
