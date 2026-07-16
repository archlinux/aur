# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SFEData
_pkgver=1.14.0
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
md5sums=('8a6f96be1a04c1e612ca57c9ff6aae7c')
b2sums=('f9b8ad2a09da0dabf360100dc99beaa004c74f779ff2fe24def1982c9a15993e08227bb2b91cf0de7b9120654a3391f84c26bea258b9a28b514dc33237009f29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
