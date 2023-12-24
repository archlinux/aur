# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breastCancerVDX
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Gene expression datasets published by Wang et al. [2005] and Minn et al. [2007] (VDX)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(Artistic2.0)
depends=(
  r
)
optdepends=(
  r-biobase
  r-genefu
  r-survcomp
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('446ef46e0bdd1480e12de21ded7b58f0')
b2sums=('61e0ee4255350d171971f023f6e1b811a5429371cd09f47d8c060b5b0b58fbfdba39fdf20b88d649b63086215ca3812cca0a81534e9a19c5bc970bfd535399c4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
