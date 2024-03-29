# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=globalSeq
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Global Test for Counts"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-s4vectors
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1b427214cf1345b8d75ba69dc02adb77')
b2sums=('aa04d988e6f966e02ab983eb008bf26df43741297f2d01159aabf9dd2b28fde158d6c41c71f7904fb85573e65a02db7b87930f40ef104fa533cf623991f5feb9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
