# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Lmoments
_pkgver=1.3-1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=4
pkgdesc='L-Moments and Quantile Mixtures'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7c9d489a08f93fa5877e2f233ab9732e0d1b2761596b3f6ac91f2295e41a865d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
