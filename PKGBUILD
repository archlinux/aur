# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringdist
_pkgver=0.9.10
pkgname=r-${_pkgname,,}
pkgver=0.9.10
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
sha256sums=('6fd42e0b7ff25843ca7f45acf9a183facfe14a6cde2dc7a97ef7126ab0f06ce8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
