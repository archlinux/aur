# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_bcname=MatrixGenerics
_bcver=1.2.1
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="S4 Generic Summary Statistic Functions that Operate on Matrix-Like Objects"
arch=(any)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=(r 'r-matrixstats>=0.57.0')
optdepends=(r-sparsematrixstats r-delayedmatrixstats r-summarizedexperiment r-testthat)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('2bcffc10cbc49f647f61dfd4fd70022b3dd6140cb637c91e1ac06c36c6076e98')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
