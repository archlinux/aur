# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=googleVis
_pkgver=0.7.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="R Interface to Google Charts"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-jsonlite
)
optdepends=(
  r-data.table
  r-httpuv
  r-knitr
  r-markdown
  r-rmarkdown
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a48cbc976f069a073979cf228fe082a')
b2sums=('95bfe78ed25df54b0403de4b81e6563d0bee0b8e9d33e14f4870362073e1f30f00adbec8416a5dcbacc23f35f2c7bc5dd9d9a8fb9650265bc05c152082af2891')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
