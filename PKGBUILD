# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parody
_pkgver=1.66.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parametric And Resistant Outlier DYtection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a713f6c9e2b05f893122bbad35957fd5')
b2sums=('fe9ae9a22ef73499c6922c00559f76d27f258be0190a1d1ea12366662d03c8e5bec075d30e004cda0fbe460756898c7cf82edafc0fb20bc68d87322956bd355e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
