# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rcompanion
_cranver=2.3.25
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions to Support Extension Education Program Evaluation"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.3.0' 'r-desctools>=0.99.17' 'r-multcompview>=0.1.7' 'r-plyr>=1.8.4' 'r-emt>=1.1' 'r-coin>=1.1.2' 'r-lmtest>=0.9.34' 'r-nortest>=1.0.4')
optdepends=(r-fsa)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('4dd3ea323ce109dfb87a453ead9fba50')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}


