# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=metadynminer3d
_cranver=0.0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools to Read, Analyze and Visualize Metadynamics 3D HILLS Files from 'Plumed'"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.3.0' r-metadynminer r-rgl r-rcpp r-misc3d)
optdepends=(r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e5dfd7281f98603d10842cb94f8f739208275a134b5a524fcd009209a1c83866')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
