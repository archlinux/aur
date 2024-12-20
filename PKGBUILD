# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SFEData
_pkgver=1.8.1
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
md5sums=('c588c28b7044354f75733556f46ef4a2')
b2sums=('a50f1295dde36a56219adc8db1bf47ac025112879597c8250800cea02a610925baccc6df9f7b3e83c9c9d8800ca64602c02f243091640ee7d7fefaf69fcb1218')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
