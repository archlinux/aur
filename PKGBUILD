# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sigsquared
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Gene signature generation for functionally validated signaling pathways"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f7dfbb4c066df8fe146b2b73f8180195')
b2sums=('7535ede28ded57e6cb6857df9ab6919c2e6d7099f0f17217ca42755e5768f6c30efdbdb16c1fd7a887ba273ee6960a1192c4a27bcf4769a2daaa5fc335e25d5e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
