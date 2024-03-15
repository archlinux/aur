# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gclus
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Clustering Graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ff6434ccb88afcfc6628374a21e7338')
b2sums=('1a09b086c13e3e7995ba4a8f646139f968b72532c07cb7077b9922720844007d9f44c96be69894cf976faadb15a0c8d4d75c4cbb3b7d2a02f316f90a77de960a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
