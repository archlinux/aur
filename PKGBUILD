# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=move
_cranver=4.1.12
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Visualizing and Analyzing Animal Track Data"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.5.0' 'r-geosphere>=1.4.3' r-sp 'r-raster>=3.6.14' r-rgdal r-httr r-memoise r-xml2 r-rcpp)
optdepends=(r-adehabitathr r-adehabitatlt r-markdown r-rmarkdown r-circular r-ggmap r-mapproj r-maptools r-testthat r-knitr r-ggplot2 r-leaflet r-lubridate r-ctmm r-amt r-bcpa r-embc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('ffe2f76165bb862357e1411aac74b4e92fef08f34164ed11f51772d9aab2802ce4067a77d3a2bef3d3f90e4d43a8a3c840b6dbcfa3258e3d12c6345e2847ff26')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
