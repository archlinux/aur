# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=textshape
_pkgver=1.7.5
pkgname=r-${_pkgname,,}
pkgver=1.7.5
pkgrel=1
pkgdesc='Tools for Reshaping Text'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-slam
  r-stringi
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de45cf4b95a3c11a18a72cfe9e6a8e09962429d71afbc9635088c34c5e1b29bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
