# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rgl
_cranver=0.107.10
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="3D Visualization Using OpenGL"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.3.0' r-htmlwidgets r-htmltools 'r-knitr>=1.33' 'r-jsonlite>=0.9.20' r-magrittr r-crosstalk mesa glu)
optdepends=(r-rmarkdown r-deldir r-orientlib r-misc3d r-magick r-plotrix r-tripack r-interp r-alphashape3d r-js r-akima r-downlit r-pkgdown r-extrafont r-shiny r-manipulatewidget r-testthat r-markdown zlib libpng freetype2 pandoc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b18e8a9f20cd0efd0d8af659544aa8be6067e8883d83219c1153a9bbc0987846')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

