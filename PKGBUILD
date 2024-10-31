# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ReUseData
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reusable and reproducible Data Management"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-basilisk
  r-biocfilecache
  r-jsonlite
  r-rcwl
  r-rcwlpipelines
  r-s4vectors
  r-yaml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c96d63fa9beb9571fd690ff5525f0713')
b2sums=('15b9016fc5c8a639090edf7021a4392036232e6054ccf5a116847e8fd7abaf1fe5d6f1e2ce2515239e23a158d7862f075c89a91c71ae7f65d6112fd7e631bd42')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
