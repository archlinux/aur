# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=textutils
_cranver=0.4-1
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
sha256sums=(c3f7c1fa46d27e8e04a43b67e1f7de8acbadc06b529fd99416a4044657562252)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
