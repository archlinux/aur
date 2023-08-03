# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=textutils
_cranver=0.3-2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Handling Strings and Text"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r-utils')
optdepends=('r-tinytest')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(b0eb2efe9bfcae9f460f673fd4679c81a82b25edd4a49dd5492e60e8412121a4)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
