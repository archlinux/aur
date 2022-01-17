# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=raster
_cranver=3.5-11
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Geographic Data Analysis and Modeling"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.5.0' 'r-sp>=1.4.5' r-rcpp 'r-terra>=1.4.11')
optdepends=(r-rgdal r-rgeos r-ncdf4 r-igraph r-rastervis r-sf r-tinytest r-gstat r-fields r-exactextractr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e6c4823925260c65fe98585d7a0d47778616ae2e4eb1a1782b219580a9db61a3')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
