# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TMB
_pkgver=1.9.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Template Model Builder: A General Random Effect Tool Inspired by 'ADMB'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  blas
  lapack
  r
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-numderiv
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6554e07819b6fc786df8d68a19733344')
b2sums=('71a1034d3739746b35181a2e13bb987a00a5d7ac4ec96c394cc5dba4a3b8c155e9a91334be08fd1c3985ca8f5fbcdb45bb81d3328725f5d0433efc9439bf269d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
