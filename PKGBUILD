# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BayesKnockdown
_pkgver=1.38.0
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
md5sums=('a821f0b31dbb99c9e50adc0e02649414')
b2sums=('554c298d24c5c25e5982969d24e0bd00671044cea47c836ce349443bc7ce5178e7e48b80906e81562792ff25904c1ca1f13772a6d6f83e0dda737db0075359b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
