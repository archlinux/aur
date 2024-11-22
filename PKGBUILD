# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=move
_cranver=4.2.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Visualizing and Analyzing Animal Track Data"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.5.0' 'r-geosphere>=1.4.3' r-sp 'r-raster>=3.6.14' r-httr r-memoise r-terra r-xml2 r-rcpp)
optdepends=(r-adehabitathr r-adehabitatlt r-markdown r-rmarkdown r-circular r-ggmap r-mapproj r-maptools r-testthat r-knitr r-ggplot2 r-leaflet r-lubridate r-ctmm r-amt r-bcpa r-embc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('22b0c4f953d7ee1def53520c7a8a1316bdc28f60663ec75b0d85970914e1ad171812c508bc959042fb381257c8a4fac080cf816ae014d212163cc7dc3dde35ec')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
