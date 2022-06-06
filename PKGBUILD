# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SubCellBarCode
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='SubCellBarCode: Integrated workflow for robust mapping and visualizing whole human spatial proteome'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-caret
  r-e1071
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-networkd3
  r-org.hs.eg.db
  r-rtsne
  r-scatterplot3d
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1cdc8597c5702bceaf93b4293986268df44063253e4102dadd96399d924e44be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
