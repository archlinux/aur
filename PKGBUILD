# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nanotime
_pkgver=0.3.8
pkgname=r-${_pkgname,,}
pkgver=0.3.8
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
sha256sums=('61ca16ebf602b5f8be70bf4589735716e52345a2e5ab4a714853e48d1011a52f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
