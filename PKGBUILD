# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BayesKnockdown
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Posterior Probabilities for Edges from Knockdown Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5e0e7e2545aa910f4895d692e5e5377e')
b2sums=('3dda6fe841995c00de54a0aa227de564cd427ec6c2a3e59ad66d73a6b830d64756533c7baa2b7226df2ad5e14f9aa1ec698f7d18b495a388ef7f041e9a2b7a7e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
