# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=nloptr
_cranver=1.2.2.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Interface to NLopt"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=(r 'nlopt>=2.4.0')
makedepends=(gcc)
optdepends=(r-testthat r-knitr r-rmarkdown r-inline)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('5e732439fa489f35ae1b32b1fd6a6cdd')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
