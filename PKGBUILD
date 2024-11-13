# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NLP
_pkgver=0.3-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Natural Language Processing Infrastructure"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df9776011515424117dfa2d0018f284f')
b2sums=('41bc397f0dbcf109be25b9503b498affda2e8edc8204510d31c94d16a4874af4c86a02ac132b3deaa76c69ae6d97a6d2214741a297036494df4d935fe31b5349')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
