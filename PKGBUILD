# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=verification
_pkgver=1.42
pkgname=r-${_pkgname,,}
pkgver=1.42
pkgrel=3
pkgdesc='Weather Forecast Verification Utilities'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-circstats
  r-dtw
  r-fields
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c2adb4b924fe09258f35719d0be8010a1c305f15d304813a9eaa5cacedbb85d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
