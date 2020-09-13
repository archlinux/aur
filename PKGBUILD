# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=move
_cranver=4.0.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Visualizing and Analyzing Animal Track Data"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.5.0' 'r-geosphere>=1.4.3' r-sp 'r-raster>=2.4.15' r-rgdal r-httr r-memoise r-xml2 r-rcpp)
optdepends=(r-adehabitathr r-adehabitatlt r-markdown r-rmarkdown r-circular r-ggmap r-mapproj r-maptools r-testthat r-knitr r-ggplot2 r-leaflet r-lubridate r-ctmm r-amt r-bcpa r-embc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('246a968399e3eab5063623f5a83a9f986a73524b23b1e39a2265916cfe0ef057')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
