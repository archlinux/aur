# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KMsurv
_pkgver=0.1-5
pkgname=r-${_pkgname,,}
pkgver=0.1.5
pkgrel=4
pkgdesc='Data sets from Klein and Moeschberger (1997), Survival Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('55627bc301245e0a4d6be04565fbaabd9cc360e2e5e4bc1e38341354e6de2542')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
