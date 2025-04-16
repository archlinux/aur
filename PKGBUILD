# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pickgene
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Adaptive Gene Picking for Microarray Expression Data Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ca4b3dca1d3a7d077f86b8428188fac')
b2sums=('4471b581e0ecbcce9fd3fb9cfcd1c5d63f78f5bb786b1d781ca2975821a6d736b76faa0bff8bae101099d7ede2983f9f8da2ef62ab29bbec58c863e03633875f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
