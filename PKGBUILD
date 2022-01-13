# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=misc3d
_cranver=0.9-1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Miscellaneous 3D Plots"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=(r tcl tk)
optdepends=(r-rgl r-tkrplot)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('a07bbb0de153e806cd79675ed478d2d9221cff825654f59a71a9cf61f4293d65')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
