# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=canceR
_pkgver=1.30.01
pkgname=r-${_pkgname,,}
pkgver=1.30.01
pkgrel=1
pkgdesc='A Graphical User Interface for accessing and modeling the Cancer Genomics Data of MSKCC'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-cgdsr
  r-circlize
  r-formula
  r-genetclassifier
  r-gseabase
  r-phenotest
  r-plyr
  r-runit
  r-tcltk2
  r-tkrplot
)
optdepends=(
  r-r.rsp
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4f4e9456293cdca97bf4360b4a418de8dff246861e7396dbffb01f930f6d63bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
