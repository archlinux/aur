# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=cNORM
_pkgver=3.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Continuous Norming"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-ggplot2
  r-leaps
)
optdepends=(
  r-dt
  r-haven
  r-knitr
  r-markdown
  r-numderiv
  r-readxl
  r-rmarkdown
  r-shiny
  r-shinycssloaders
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35d8c2136498c8a126897252907f49d9')
b2sums=('5923c64c2518f506a035c61f6a5e3d550cfd97af4f80523b62a3de8d0359536591563b855f25ecf67614979ce3f39d48e856e28f64bccdb63e8c0246809e3c60')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
