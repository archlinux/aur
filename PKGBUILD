# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rappdirs
_cranver=0.3.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Application Directories: Determine Where to Save Data, Caches, and Logs"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=2.14')
optdepends=(r-testthat r-roxygen2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('2fd891ec16d28862f65bb57e4a78f77a597930abb59380e757afd8b6c6d3264a')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
