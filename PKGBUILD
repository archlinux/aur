# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=verification
_pkgver=1.44
pkgname=r-${_pkgname,,}
pkgver=1.44
pkgrel=1
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
sha256sums=('140ea006b98da0e9ac64231ff8a50d0aa878d3a7ad65c95d2fc548118506ab24')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
