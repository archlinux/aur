# Maintainer: articpenguin <julia.schweinz at mailfence dot com>

_cranname=findpython
_cranver=1.0.7
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R package designed to find an acceptable python binary"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('59f904b9c2ec84b589380de59d13afbf14d1ec3b670e3a07e820298aaf04c149')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
