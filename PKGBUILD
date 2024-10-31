# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proteinProfiles
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Protein Profiling"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd105d4f0730d834b3485b18a6244163')
b2sums=('1b8fdc7520f325a0b7a2e3a072a6750c68f30f20d00d042224349636dfc11b231ab705bb00970f7875989787011bd00d7b2d26601741094a87d9ab2af55a8608')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
