# system requirements: Gnu Scientific Library version >= 2.1
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsl
_pkgver=2.1-7.1
pkgname=r-${_pkgname,,}
pkgver=2.1.7.1
pkgrel=3
pkgdesc='Wrapper for the Gnu Scientific Library'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  gsl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee98d1382d37ffa77538a90ccdbf44affbf1710a9e66b8ada73fa72e67921985')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
