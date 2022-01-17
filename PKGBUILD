# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=tikzDevice
_cranver=0.12.3.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Graphics Output in LaTeX Format"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=2.14.0' 'r-filehash>=2.3' r-png 'libpgf>=2.00')
optdepends=(r-evaluate r-formatr r-ggplot2 r-knitr r-lattice r-maps r-scales r-stringr r-testthat r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('5bed80c0fca8806f0d0c0c2930e7184119b3abd7275165530d251410b9f91e10')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
