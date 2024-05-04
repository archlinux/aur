# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yeastCC
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spellman et al. (1998) and Pramila/Breeden (2006) yeast cell cycle microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9f4ff71d1469ef4efbd4c9dcd16bc172')
b2sums=('f5f138fbe17fb230b92d99c2b019bb0f915afcd7eaa25db61d87f90900efc877d26d150c79134d41a7ee0d68af5f2b3ceb05455ee2e210b225e5b9d3a1f045dc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
