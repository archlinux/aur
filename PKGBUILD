# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRanslatome
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
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
sha256sums=('8f0548b9a3b7c75295eff88c0f9fbbd3637fc820d74879a3df8c9eca8e3ad976')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
