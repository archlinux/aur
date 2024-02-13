# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gscreend
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Analysis of pooled genetic screens"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-fgarch
  r-nloptr
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6d79483ce0c766b1779a2dab5614e249')
b2sums=('0df96be2c84afbeb760dbe395c0b03bb7998afd87c84f4ce4b8d91a88d9f6a9476ed7643e844703f90e292394a8e9178a1322847577cef0f8938da7304ddaa73')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
