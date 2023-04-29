# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iCheck
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('670ee1ca0f74a46746477246accd3a911c668b27609c28963fa3b7d91835c121')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
