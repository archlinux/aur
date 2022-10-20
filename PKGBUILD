# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringdist
_pkgver=0.9.9
pkgname=r-${_pkgname,,}
pkgver=0.9.9
pkgrel=1
pkgdesc='Approximate String Matching, Fuzzy Text Search, and String Distance Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd14179820aadc2898e3dbcbc8877b918f7202e489756de1674d7d55447e6f5e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
