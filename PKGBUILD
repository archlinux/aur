# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcellViper
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Human B-cell transcriptional interactome and normal human B-cell expression data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e082806ccb32f233953c7c594fd20aa3')
b2sums=('d42913d5d5945ef2cf6c73f17119e305c7317350280b2a68e9842247ef5140a7f019410bb16da4f617f24ea5b39cc5d94dc4629511b0f9f28982b889bc47fe72')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
