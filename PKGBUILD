# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=textutils
_cranver=0.2-1
_updatedate=2021-04-02
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Handling Strings and Text"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r-utils')
optdepends=('r-tinytest')
source=(https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(9025cf9b372601c0a38ea4d952c16cd77413d0193b6c95cf508a09a3e1def91d)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
