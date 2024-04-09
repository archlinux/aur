# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MCL
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Markov Cluster Algorithm"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-expm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c058c91e0910288a5e46a90ec954e34f')
b2sums=('36aadb94df9af7abddd7a1d42bc409226d8fc38c8d5a9d5527cb4a195c7e39bfea41f9712ab3e1822e976ae1f0f79c8102e8b4126214b7d3773e8f13915a0e47')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
