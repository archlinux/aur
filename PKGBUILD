# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FoldGO
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Package for Fold-specific GO Terms Recognition"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-tidyr
  r-topgo
)
optdepends=(
  r-devtools
  r-kableextra
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('230ddc55d983a828d401eac9e44590d4')
b2sums=('4ccd80ab4f92ef3772377935aef4d90bd408bb1ff9c0a08f3781d186b75162f1ad1afb8afd806e117e818afeb00add0e3b43c99d3578d4fe93e41cc2f42ea28c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
