# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CDFt
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=4
pkgdesc='Downscaling and Bias Correction via Non-Parametric CDF-Transform'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c1a88b31fb2ad2e174bdfcd1ab980ee5581920f3a555e5b4d5ea25b886535da5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
