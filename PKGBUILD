# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=coin
_cranver=1.3-1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Conditional Inference Procedures in a Permutation Test Framework"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.4.0' 'r-libcoin>=1.0.0' 'r-matrixstats>=0.54.0' 'r-modeltools>=0.2.9' 'r-mvtnorm>=1.0.5' r-multcomp)
makedepends=(gcc)
optdepends=(r-xtable r-e1071 r-vcd r-th.data)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('2f6cd1280b854ec10434b553b50707ad')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}


