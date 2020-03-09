# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=move
_cranver=3.2.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Visualizing and Analyzing Animal Track Data"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=2.15.0' 'r-geosphere>=1.4.3' r-sp 'r-raster>=2.4.15' r-rgdal r-httr r-memoise r-xml2 r-rcpp)
makedepends=('gcc>=4.3')
optdepends=(r-adehabitathr r-adehabitatlt r-circular r-ggmap r-mapproj r-maptools r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('017e0854f5ad83f995f7d5d46236b622')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
