# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nanotime
_pkgver=0.3.9
pkgname=r-${_pkgname,,}
pkgver=0.3.9
pkgrel=1
pkgdesc='Nanosecond-Resolution Time Support for R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bit64
  r-rcpp
  r-rcppcctz
  r-rcppdate
  r-zoo
)
optdepends=(
  r-data.table
  r-tinytest
  r-xts
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc2965edfd68f83a84142ead27a5a84e1c5b2931ec911dddecb3e0bc3ffa79d8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
