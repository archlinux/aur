# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=fontawesome
_cranver=0.2.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Work with 'Font Awesome' Icons"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.3.0' 'r-rlang>=0.4.10' 'r-htmltools>=0.5.1.1')
optdepends=(r-covr r-knitr r-testthat r-rsvg)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('572db64d1b3c9be301935e0ca7baec69f3a6e0aa802e23f1f224b3724259df64')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

