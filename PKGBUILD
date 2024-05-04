# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGMQLlib
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="java libraries to run GMQL scala API"
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
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd89eebe085adb6eae527f4e5ce92188')
b2sums=('93da28fdf8ab0d0cd43303974d7429eefac77448d2aa9e81b8b849b5473f00a07cc34831a3f06658056598f5db98b416c9d854eb44117df7101948652dc4e56a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
