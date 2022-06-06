# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genetics
_pkgver=1.3.8.1.3
pkgname=r-${_pkgname,,}
pkgver=1.3.8.1.3
pkgrel=4
pkgdesc='Population Genetics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-combinat
  r-gdata
  r-gtools
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fef2c95f6a57f32b3cf4acf003480439462bb28297c501c617de307bfeee9252')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
