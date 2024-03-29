# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maCorrPlot
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Visualize artificial correlation in microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4d4be51b04e4ff3e09aff6643eeed215')
b2sums=('1739fc5d560b984619dcb71eba5d631aba3c5b471c42643f9df08781a836b1fedf408a86d7719de09087925beb70beb1b0245752eaf2aa034b5017119587c2b3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
