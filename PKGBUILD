# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iCheck
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='QC Pipeline and Data Analysis Tools for High-Dimensional Illumina mRNA Expression Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-geneselectmmd
  r-gplots
  r-limma
  r-lmtest
  r-lumi
  r-preprocesscore
  r-randomforest
  r-rgl
  r-scatterplot3d
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7addbd2960616f08ed93fc94958bbe958106fca4ca28ca8a53de1d7f4d92429c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
