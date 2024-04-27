# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flexclust
_pkgver=1.4-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Flexible Cluster Algorithms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-modeltools
)
optdepends=(
  r-clue
  r-ellipse
  r-seriation
  r-skmeans
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ec9f4ba63ae35b8fff0e13ae7f4233a')
b2sums=('329dd5924749170f048f12824153ef8c830f1730c1fc3476dc97c666ec8cbd1b5d497c7b4c40ec071394f7775a2cadb5f6a6188d5d32d28c1311d8d7d7332c76')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
