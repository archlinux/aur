# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imp4p
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=1
pkgdesc='Imputation for Proteomics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-iso
  r-missmda
  r-missranger
  r-norm
  r-rcpp
  r-truncnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('80a5fb602252c2f0fa7478a705ffc1b11faea179fd3d9c6e5c3b66f6be6f1d2b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
