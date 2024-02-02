# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pastecs
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package for Analysis of Space-Time Ecological Series"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-svunit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ae8c1a1da977897a3688f262bbc13c3')
b2sums=('fc318bfa9e1aa48c08ddd393ab2aacbab643da1014e6928996fec1ac5acecdb835464ef2f283faa9ef1db4e855f6e8a2073d2f5dcf0d68905452a72e6a70551e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
