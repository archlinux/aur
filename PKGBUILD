# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GoFKernel
_pkgver=2.1-1
pkgname=r-${_pkgname,,}
pkgver=2.1.1
pkgrel=4
pkgdesc='Testing Goodness-of-Fit with the Kernel Density Estimator'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a3218f1a774d1c7703a5580c37b2e03d72aaf8ac6190eb9d7265d0f76ad3cf77')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
