# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=sp
_cranver=1.3-2
pkgname=r-sp
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Classes and Methods for Spatial Data"
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL2' 'GPL3')
depends=('r>=3.0')
optdepends=('r-rcolorbrewer' 'r-gdal' 'r-geos' 'r-gstat' 'r-maptools' 'r-deldir')
makedepends=('gcc')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('940a22add254fbb5ebd80a380f4777fcd1af282975ebad400d177f3a20d6f24e')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
  cd "${srcdir}"

  install -dm0755 "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
