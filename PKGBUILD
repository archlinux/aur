# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=MatrixGenerics
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="S4 Generic Summary Statistic Functions that Operate on Matrix-Like Objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-matrixstats
)
optdepends=(
  r-delayedarray
  r-delayedmatrixstats
  r-sparsearray
  r-sparsematrixstats
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('be0b5a464be94a86963f7c1c30c8c3da')
b2sums=('faa963f2471bbb7a0d274246de9a667d8648f08d7921b3d236ffedfb9936ff601feeba5e5ac988d6ef7d115bd9a97aeac49849514762c7fc546383bf168a1991')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
