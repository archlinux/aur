# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=similaRpeak
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Metrics to estimate a level of similarity between two ChIP-Seq profiles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-r6
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-genomicalignments
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2186454c92931fd6ec881ccbe0c6482e')
b2sums=('3279bde03879f1394e9ae1d078565f14769b4e2d2beeb63024f702b9f2d2ace5dbf1edceaaa44adfdde3ccfc70fb2b80a9539eff633c80cb86ca88b11d807f7f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
