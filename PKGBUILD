# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPeaks
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for flow data clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-1.0-Perl')
depends=(
  gsl
  r
)
optdepends=(
  r-flowcore
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('677cef8a7d86d1bcdb5d9a2d37c3ef78')
b2sums=('d5161d0590812da05545dcc4a0d36b8e3fb74b47636af2dfe8f19f64ac670e20204d6fed52d3227516706beb6bbbeef93c665000b56472afc126b9522a187e32')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
