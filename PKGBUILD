# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DFP
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7da84966f3e54463d5c52c1d432b8d71')
b2sums=('6f561ccd8d4c45cf05d60b0b0bc7ba0a88b91d2ab3916accd8de3a26ec6d82dc45e082aa9132bba9132e76d4c31e91e054bb7845cb9521f0a32c282eb28415a0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
