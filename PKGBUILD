# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MOFAdata
_pkgver=1.28.0
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
md5sums=('5e2c36ae57a1a692d9896a8f355140c2')
b2sums=('aca4c8909412de657ac86411c18827f3df67d457bb138ca064b5a6c5682cad63355d8c7373b603994b55906a11b422ad62424aabab13846f5cb8320de269b3fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
