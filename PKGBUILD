# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPeaks
_pkgver=1.50.0
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
md5sums=('1d8be3672ed678a3d8e8c38ee88c041e')
b2sums=('74113e25c5350f2551295e70ea274563e9298893e5860c68525cd024c848f26356700e3b42d2281b88c4aceacf9e7137ffab7de5ce3eb37c518e7564a89f4eb3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
