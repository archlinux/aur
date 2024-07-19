# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iC10
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Copy Number and Expression-Based Classifier for Breast Tumours"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ic10trainingdata
  r-impute
  r-pamr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af2963892b0f3f46eadfa44424077532')
b2sums=('ab65a169748c12b577a5f00557b45b929527ed6869f38b8faf75a003f9be382828331367748730375f3f46730e5f16121edc7f5e24c7eb7c6143190e953d058c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
