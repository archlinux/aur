# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=DiceKriging
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Kriging Methods for Computer Experiments"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2 GPL3)
depends=(r)
optdepends=(r-rgenoud r-foreach r-doparallel r-testthat r-numderiv)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c65dc2abd006fc3d3e07f97f4fe6571ff822f4e4ecce00e769fc9c0651c1ad2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
