# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBAmethyl
_pkgver=1.40.0
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
md5sums=('c2a206e48019dbb7e521593e2d2992e6')
b2sums=('510cf6f2852d577f06c953ac33a87547a6965c234e8226ee6cbe5c3c84bc5adbbf4ad63eddefe321581ba6940b7b9d34bd4bc7f56f04413f7d123d98ba41baf0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
