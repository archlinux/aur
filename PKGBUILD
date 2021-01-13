# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rgl
_cranver=0.104.16
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="3D Visualization Using OpenGL"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.2.0' r-htmlwidgets r-htmltools r-knitr 'r-jsonlite>=0.9.20' r-shiny r-magrittr r-crosstalk 'r-manipulatewidget>=0.9.0' r-mathjaxr mesa glu)
optdepends=(r-rmarkdown r-deldir r-orientlib r-misc3d r-rstudioapi r-magick r-plotrix r-tripack r-interp r-alphashape3d zlib libpng freetype2 pandoc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b82d2e2b965e76d6cc55bbd15ee0f79c36913ab09ce5436d2104551563462a99')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

