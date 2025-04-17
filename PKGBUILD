# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yeastCC
_pkgver=1.47.0
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
md5sums=('077fa47da9c0b4fcafd2560bc0486803')
b2sums=('6d67d496c45435545262917ba468caf71d0ae08aaeda9e47b9f3688d417e50706a6fdbabbee2932d5e1660457e391c3a4a1534e8db1f174697c848568898b4d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
