# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SFEData
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example SpatialFeatureExperiment datasets"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-annotationhub
  r-biocfilecache
  r-experimenthub
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-spatialfeatureexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f3376870c972cba309b26d52d24fcbb')
sha256sums=('1f374b0e109d35998935c8ce83f0e83574792cea548bf928837b7fa2d9116b72')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
