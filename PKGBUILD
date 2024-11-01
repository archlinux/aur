# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MOFAdata
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for Multi-Omics Factor Analysis (MOFA)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3f8a0f3d03b4fa72d75a782592539c5c')
b2sums=('40340bc953e9ba670a3fc2286ef709d2e43b2892a4d976e82d174b620f04f439475526bba474178947120cfcb7d7531fe47ee4aeb4b432af0fdc21060ab0f60d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
