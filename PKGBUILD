# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rgl
_cranver=0.106.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="3D Visualization Using OpenGL"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.3.0' r-htmlwidgets r-htmltools r-knitr 'r-jsonlite>=0.9.20' r-shiny r-magrittr r-crosstalk 'r-manipulatewidget>=0.9.0' mesa glu)
optdepends=(r-rmarkdown r-deldir r-orientlib r-misc3d r-rstudioapi r-magick r-plotrix r-tripack r-interp r-alphashape3d r-js r-akima zlib libpng freetype2 pandoc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('a55ca0e680da370cbf4909dd7f45eeac6d90f55470b1bdc3770547ee84cb6d81')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

