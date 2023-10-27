# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oncomix
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Identifying Genes Overexpressed in Subsets of Tumors from Tumor-Normal mRNA Expression Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-ggrepel
  r-mclust
  r-rcolorbrewer
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rmysql
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('02bb5aa539f2c5ec2d179f8f4877244e5328c4e9b825961e13022ff9e11a3128')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
