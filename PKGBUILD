# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=DiceKriging
_cranver=1.6.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Kriging Methods for Computer Experiments"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=(r)
optdepends=(r-rgenoud r-foreach r-doparallel r-testthat r-numderiv)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ab5d1332809f2bb16d156ed234b102eb9fbd6de792e4291f9f6ea4652215cb49')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
