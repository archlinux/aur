# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontologyIndex
_pkgver=2.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reading Ontologies into R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ebbcda13ca7f5cf8663769d740b09f0a')
b2sums=('756f229447da9a3427187487f0b12660515be166911247cee989503c9aba2777d5514ec7bf3fefac4ca4b3d8f5c26e75c865b1cab2208ceee281394f51dfc75a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
