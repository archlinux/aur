# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GWASExactHW
_pkgver=1.01
pkgname=r-${_pkgname,,}
pkgver=1.01
pkgrel=4
pkgdesc='Exact Hardy-Weinburg testing for Genome Wide Association Studies'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e850ed40fbf14b02eb3798603cfb111fe3718bb69d74c0ff4cb6f679209a15a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
