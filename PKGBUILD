# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=crmn
_pkgver=0.0.21
pkgname=r-${_pkgname,,}
pkgver=0.0.21
pkgrel=4
pkgdesc='CCMN and Other Normalization Methods for Metabolomics Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-pcamethods
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('659eb2ba41111ef7a17e1ffe75750735ec9cf2394e881eee4b05f9c3b54be972')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
