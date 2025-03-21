# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iCheck
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('a40589e66123050abfb41b537f8a53d60e71b2a43935f5575349be73187df882')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
