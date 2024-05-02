# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matchBox
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities to compute, compare, and plot the agreement between ordered vectors of features (ie. distinct genomic experiments). The package includes Correspondence-At-the-TOP (CAT) analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('557f7ba5bc80414ad51218c2962acf21')
b2sums=('3997b891b805049b8678a7e859716004053e278e4dbdb46fce1e338bd6ec4f16ca30f6fa0a5c73fc3a862af267f14d61fc0ae630f97473d69d9766e98e9bdd16')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
