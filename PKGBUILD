# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randtests
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=1.0.1
pkgrel=1
pkgdesc='Testing randomness in R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('479558010cc7aa44d83bfa51d35f8f1d814958e405408f71395a539c9e392be4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
