# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cancerclass
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Development and validation of diagnostic tests from high-dimensional molecular data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-binom
  r-biobase
)
optdepends=(
  r-cancerdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('116324a4bf732430c8280593e5eec0ab')
b2sums=('faff29ec5314a7090f347f8b808b73e58d824705a84525440e050e6a3946b0abe21376f4bf8c9f815d5d2e66f434bd909c2e3b04c8251e67355c637cd53e1b44')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
