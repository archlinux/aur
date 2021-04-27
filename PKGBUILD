# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=httpuv
_cranver=1.6.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="HTTP and WebSocket Server Library"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=2.15.1' 'r-rcpp>=0.11.0' r-r6 r-promises 'r-later>=0.8.0')
makedepends=(make)
optdepends=(r-testthat r-callr r-curl r-websocket)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('75eee06bd3155c17424a5d9abca3056bfb790052897ae9be8d5e3b3244ea2006')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
