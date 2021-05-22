# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=viridis
_cranver=0.6.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Spatial Data"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=2.10' 'r-viridislite>=0.4.0' 'r-ggplot2>=1.0.1' r-gridextra)
optdepends=(r-hexbin r-scales r-knitr r-dichromat r-colorspace r-rastervis r-httr r-mapproj r-vdiffr r-svglite r-testthat r-covr r-rmarkdown r-rgdal)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('48044c8aa7f24a349a10a853f2dc1e60e363f0456567d82dbb3e4ae6cde8cabb')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
