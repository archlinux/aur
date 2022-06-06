# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rwave
_pkgver=2.6-0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
pkgrel=4
pkgdesc='Time-Frequency Analysis of 1-D Signals'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eb6338e9e3ee774cc4fcabe366fef5ef97bd291cc83f22d8537d16bbaa8a24ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
