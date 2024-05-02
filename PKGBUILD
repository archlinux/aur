# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breastCancerVDX
_pkgver=1.41.0
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
md5sums=('f116a163d4347417d6b502502f961eea')
b2sums=('0d2a84d581f4d7232627d3f4f246126a0a242c7f60443052dd844d0be073e632abb3ade528578526c1768bfc7f350c46a450fbdebe9800ebd9d4a3f1555d089b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
