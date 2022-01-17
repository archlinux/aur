# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=futile.logger
_cranver=1.4.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Logging Utility for R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=('r>=3.0.0' 'r-lambda.r>=1.1.0' r-futile.options)
optdepends=(r-testthat r-jsonlite)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('5e8b32d65f77a86d17d90fd8690fc085aa0612df8018e4d6d6c1a60fa65776e4')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
