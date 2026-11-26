# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breastCancerVDX
_pkgver=1.51.0
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
md5sums=('1e4ec1617aec1afe8a44bbbdb1d91eb1')
b2sums=('ad7a6dfa4e588c947246628bbaf8adf9cbddf186817774e019d798abab451f75ff601d3bb58e4cb9a94651c80e21bc6fa96aadf58a06e8f30dda754b9e69c2d4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
