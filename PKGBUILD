# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBAmethyl
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Model-based analysis of DNA methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc5611bca4d0d0ba64e98b6ba3345a28')
b2sums=('3d603165397b4269ccacfcd893a667fb3a9cd335588db0ae20cd80f28bd5257bc014b0b1213d663e9b17fa6562b65072eb6e38bfedede1dc4f1c36278ee827db')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
