# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPeaks
_pkgver=1.56.0
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
md5sums=('46269bf2e9fa1a8eebb4f0b297890ab2')
b2sums=('60141690f97051cda03cc590a9f610105f13e1f27175810f1f14eaa86b3f8634ad0771e7d95e39881b9f2ca567ea44bdd9f07de0ad819840dc8fef53a74ce535')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
