# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcapture
_pkgver=1.4-4
pkgname=r-${_pkgname,,}
pkgver=1.4.4
pkgrel=1
pkgdesc='Loglinear Models for Capture-Recapture Experiments'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('992d59e773d7936d4641797b769de481ef76834e7668b082e64f255cef93307a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
