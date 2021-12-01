# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rcompanion
_cranver=2.4.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions to Support Extension Education Program Evaluation"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=4.1.0' 'r-desctools>=0.99.43' 'r-multcompview>=0.1.8' 'r-plyr>=1.8.6' 'r-coin>=1.4.2' 'r-lmtest>=0.9.38' 'r-nortest>=1.0.4')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e760bf75213f5868e6fea4dc7a5734a87d2740e9b26668f239ae516f2ba71295')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}


