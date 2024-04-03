# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=smoother
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=1
pkgdesc='Functions Relating to the Smoothing of Numerical Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ttr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e8df4bc88e9d95c30c66fc10e6b1b485626828b6d28ad1a52a20168736468277')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
