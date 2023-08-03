# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=httpcache
_cranver=1.2.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Query Cache for HTTP Clients"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.0.0' 'r-digest' 'r-httr>=1.0.0utils')
optdepends=('r-httptest>=3.0.0' 'r-knitr' 'r-rmarkdown' 'r-spelling')
source=(https://cran.r-project.org/src/contrib//${_cranname}_${_cranver}.tar.gz)
sha256sums=(798c004f59826d1c2da16c58a212dc1facf225c29cc2d4a21e54053052a0da08)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
