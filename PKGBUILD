# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lokern
_pkgver=1.1-10.1
pkgname=r-${_pkgname,,}
pkgver=1.1.10.1
pkgrel=1
pkgdesc='Kernel Regression Smoothing with Local or Global Plug-in Bandwidth'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sfsmisc
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d3cfb4ba873c9affe3f63f3b6d2a72a8f5b67aa05771799ead7458bd38a8950')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
