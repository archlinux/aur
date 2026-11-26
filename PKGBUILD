# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ARRmNormalization
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Adaptive Robust Regression normalization for Illumina methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-arrmdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('87e1ddb0b353a0517a035c3b4eeb4f00')
b2sums=('937e457cbfa417b353d1c3d382e8a5e294cd7487f1aaa5b7810320ce21071e724165cf7b28812cdfbc00c61a323831de0b45195939b2dea5108a2e391def4e4f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
