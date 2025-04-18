# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bladderbatch
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bladder gene expression data illustrating batch effects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c6db7b72946332f217d965055d44084e')
b2sums=('13b2f86577de9372c6d7399446490d815ab92ab923591a8c4cf54096338bda52e98391caac05f4d7baf6630b9289c422772b7a30211548967fe9c622cd07bdc7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
