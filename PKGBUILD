# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pryr
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=0.1.6
pkgrel=1
pkgdesc='Tools for Computing on the Language'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lobstr
  r-rcpp
  r-stringr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('68c1a30a42808eb01a64d31e521d21f2fd5a88dd2c14d05b4b7986d27a177704')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
