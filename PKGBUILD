# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rgl
_cranver=0.103.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="3D Visualization Using OpenGL"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=4.0.0' r-htmlwidgets r-htmltools r-knitr 'r-jsonlite>=0.9.20' r-shiny r-magrittr r-crosstalk 'r-manipulatewidget>=0.9.0' r-mathjaxr mesa glu)
optdepends=(r-rmarkdown r-deldir r-orientlib r-misc3d r-rstudioapi r-magick r-plotrix r-tripack r-interp r-alphashape3d zlib libpng freetype2 pandoc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('be718ee603408ace9b6c55381a36bcbedf02a7c66938362138e8194ede7bc3ed')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

