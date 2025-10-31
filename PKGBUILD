# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breastCancerVDX
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene expression datasets published by Wang et al. [2005] and Minn et al. [2007] (VDX)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biobase
  r-genefu
  r-survcomp
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0573c86b9bcadf46d0e9da24ab2e5fd')
b2sums=('16d3227e40441efa956d30cf6ce5e883fbd0e64d4c3c9022988aad1796fa48e9ec1eb844d315dad1dfcb518e45a792ce7a0ff343cb38b87f113c09324e27fef6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
