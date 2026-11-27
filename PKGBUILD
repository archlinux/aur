# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SFEData
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example SpatialFeatureExperiment datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biocfilecache
  r-experimenthub
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-seuratobject
  r-spatialfeatureexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0bafbb05ddbbb37031c2af55e312f36e')
b2sums=('9fab51e823797ea6f4d4cc67517d1bf6f5fc7fbcbb9e0082507dfc0bfad4ec47e73ed139088c12f3b2abc93ee91e65f728cc33628789b77d939dc72ce592caaa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
