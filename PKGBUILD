# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SubCellBarCode
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('a8d83adaff4381922dc153bd0d2bd0c655b8fe780d07c0598cdb9bbd9c55183f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
