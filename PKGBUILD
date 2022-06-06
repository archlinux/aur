# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rlab
_pkgver=4.0
pkgname=r-${_pkgname,,}
pkgver=4.0
pkgrel=1
pkgdesc='Functions and Datasets Required for ST370 class'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3744ecb97a3858ac3386586fbfd87320b06c4ec086e987e69b9a88f23ab3905')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
