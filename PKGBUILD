# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=twilight
_pkgver=1.90.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of local false discovery rate"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-golubesets
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d74bc0c2cef38fc268ca0884c90d3b6d')
b2sums=('8af3e68ff9049494bf444e6794268b6a851bc4452c26c5e3088f2a87fdd12a1d5156acf78cbdcc80f971285a5a8d93a826976682f9327446e90cf2a56c1f796f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
