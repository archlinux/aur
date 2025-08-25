# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=data.tree
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="General Purpose Hierarchical Data Structure"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-r6
  r-stringi
)
optdepends=(
  r-ape
  r-diagrammer
  r-doparallel
  r-foreach
  r-formula
  r-htmlwidgets
  r-jsonlite
  r-knitr
  r-mockery
  r-networkd3
  r-party
  r-partykit
  r-rmarkdown
  r-testthat
  r-treemap
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a456eff17400a38feb07cd0497ea4141')
b2sums=('259aeeaaccb4a739c16c3a7459797c3af33e2e57aedf877fefe8bafbfd7c65584ce30a743909e477500e352582afd537a6243f75588e610fbb4d83620b63fa11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
