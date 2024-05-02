# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffGeneAnalysis
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Performs differential gene expression Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-minpack.lm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3878a8196c65c76c73df1eb856577371')
b2sums=('454a629af4cf49f57bf72258bd6e197f23b589d90023ddea2f1d96c2031b074a97e73a8124d495caab2fe9da9d152e98f3ea7d1f213106aed68eaf965a174233')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
