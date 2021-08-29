# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_bcname=MatrixGenerics
_bcver=1.4.3
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="S4 Generic Summary Statistic Functions that Operate on Matrix-Like Objects"
arch=(any)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=(r 'r-matrixstats>=0.60.1')
optdepends=(r-sparsematrixstats r-delayedmatrixstats r-summarizedexperiment r-testthat)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('5b46f83c1dbffabda4baeaa1bd1f4ab31c760aa3fbba61db056e970f791e39fa')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
