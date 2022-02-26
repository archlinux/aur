# Maintainer: articpenguin <julia.schweinz at mailfence dot com>

_cranname=argparse
_cranver=2.1.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Command line argument parser library for R"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2' 'GPL3')
depends=('r' 'python' 'r-r6' 'r-jsonlite' 'r-findpython')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('aeda31a54a8d7a0a511cfbf7c5868637e129922671d43938165867437fb6a66e')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
