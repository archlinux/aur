# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=showtextdb
_cranver=3.0
_archivedate=2020-06-05
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Font Files for the 'showtext' Package"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(Apache)
depends=('r-sysfonts>=0.7' r-utils)
optdepends=(r-curl)
source=("https://cran.microsoft.com/snapshot/${_archivedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(027f5d0ab91eb27c72b6e918a2915b6087f7408b66c1630d69b3e507dd609642)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
