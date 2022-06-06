# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imp4p
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=3
pkgdesc='Imputation for Proteomics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-iso
  r-missforest
  r-missmda
  r-norm
  r-rcpp
  r-truncnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('40bb74d35305aef10e0ff8f520a0cbcdd6f4d48a3f1e6dfba949469aa55ca8d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
