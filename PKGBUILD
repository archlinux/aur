# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMallow
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Fit Multi-Modal Mallows' Models to Ranking Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-combinat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9a469dee1335f52858881cac6018f842')
b2sums=('d3d06acabff8a649cd54d7f007183ec63729ed3094f58a5e71984dfb669fbab1d0c7e5306baeb75ca601fbb619533db4dc837e07827d4cb02c04eb8fc27f7e9e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
