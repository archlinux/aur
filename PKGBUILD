# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: krant <aleksey.vasilenko@gmail.com>

_pkgname=tuneR
_pkgver=1.4.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Analysis of Music and Speech"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=('r>=3.0' 'r-signal')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('364154a0440953327eeefd2f3c72c9f819944cbb52b6e7497958882ca0b6960a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
