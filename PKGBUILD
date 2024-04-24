# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dirmult
_pkgver=0.1.3-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Estimation in Dirichlet-Multinomial Distribution"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('253ce25a8287c81ad68a716cd2fe2ab6')
b2sums=('dc8bb43299529f332bcdc108ab996036ae65dc1a186df3b73520ab0edf77a0c95c40ee08e0a2b81741e72ff9bffe8d00dfcc19e82614ca2b8308e296041bcf51')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
