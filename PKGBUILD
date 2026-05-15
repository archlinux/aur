# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=cNORM
_pkgver=3.5.4
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
  r-readxl
  r-rmarkdown
  r-shiny
  r-shinycssloaders
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e8558d0268ce4c9fe10837bb8ce56fcd')
b2sums=('d58e79b71f0583011d0c51c4ea3e0fe90204de28686c3664341b56e51ad90468ec198b8a929ef0c6e5eb31d1df40f7ec7de3d0fb88f1d5093a423f50eac83f8a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
