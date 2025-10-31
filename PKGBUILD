# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BayesKnockdown
_pkgver=1.36.0
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
md5sums=('ee211bdf1eb84fdc6010d1ab368a540e')
b2sums=('f97c8e61594f57262b31db300d55325761071e02e5ac97c835dffc70465741c83e983ac58aadd24714025c6150b199f4dcecd1039fe382a483b3da74b351575c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
