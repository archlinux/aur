# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SFEData
_pkgver=1.6.0
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
md5sums=('db807c17ae3c8291c3bad1da4e34db44')
b2sums=('542e4601b4bb388cf4c5b28e9798c4b1e701a1f9c350f79e5d87f3b6d14091a36a47296f1735e5ebee15ad442c00f139c8927d59fb0308862a2ccd733a2beb50')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
