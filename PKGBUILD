# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=pkgbuild
_cranver=1.2.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Find Tools Needed to Build R Packages"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' 'r-callr>=3.2.0' r-cli r-crayon r-desc r-prettyunits r-r6 r-rprojroot 'r-withr>=2.3.0')
optdepends=(r-rcpp r-cpp11 r-testthat r-covr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('1927566aa67278131f8079a03f1dd238f0ec50cdcbafdb23746e114b70bbd7aa')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
