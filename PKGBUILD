# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poibin
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="The Poisson Binomial Distribution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ccb27983b15b6670ae4b454bea9bd0a1')
b2sums=('818f937ae9c1b013dff2b623185b7337a7a0d411c53098a178f6e65b19a1c396b2235a056d9e3510436d9ea1787b4b11189653f2a0719a1d448ed63e17d6256a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
