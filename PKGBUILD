# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TMB
_pkgver=1.9.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('60a93c9edc85494234d74fdd8655151d')
b2sums=('b690ea1dc0d6172d384d852ed2401ff6045c684af154ee814369214a37c17fef400160a748d28acd20789385514d402d3dfa1f919a35fa54fe6dba99ecd05294')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
