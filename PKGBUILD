# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matchBox
_pkgver=1.52.0
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
md5sums=('ddc92c5cb4bb447720b6a4058209ce25')
b2sums=('81269aaf93739ae02939b36d66d9f94173df305f973c12c3386a077d164dd8e03d3663ba3512e93ba3919aff37afb30b1469dcbad075bfe09aa02026b2b6d420')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
