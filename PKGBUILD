# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=skmeans
_pkgver=0.2-21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spherical k-Means Clustering"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-clue
  r-slam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('acea8e16f276299d607b07ac620ce7df')
b2sums=('b48e4454b794e87a05b0a72120f00c20e96872bd49c349da62df96e94b95e19b60e565c4c5c6e26ee11f3fe5efe6eedf1f65c14990db79779a3e49bc83fe7744')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
