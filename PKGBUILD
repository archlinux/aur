# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytoMEM
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Marker Enrichment Modeling (MEM)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-flowcore
  r-gplots
  r-matrixstats
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('81a1fd3e6e1a8cb0e08ef0868dff5820')
b2sums=('d0296d64ccd8f6ee61a786170123ada43f0903696f58824a273d9400137a2575fac1338e91255f5fb06c60fe87583cfacdaaf58dad1c81848c567d3283cf7222')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
