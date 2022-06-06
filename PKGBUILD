# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=precrec
_pkgver=0.12.9
pkgname=r-${_pkgname,,}
pkgver=0.12.9
pkgrel=3
pkgdesc='Calculate Accurate Precision-Recall and ROC (Receiver Operator Characteristics) Curves'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-data.table
  r-ggplot2
  r-gridextra
  r-rcpp
  r-withr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('150b198464175a5fe4e1f5080279e459e6211b060f2a4072a18273d17116dfb5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
