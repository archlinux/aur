# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DynDoc
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Dynamic document tools"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d5ea2c0b36289466bdb8095b39634fd')
b2sums=('94d74e2b10ca6e65f0b6ef360bc95039ab12b00bde38de57eb248a882dfe101de40eb35d984ad71962583e4a9dda641653709ae74cf20a5340a528601a43666f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
