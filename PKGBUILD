# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetaboCoreUtils
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Core Utils for Metabolomics Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-mscoreutils
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-robustbase
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('10bfc049ffd1203f5023d47ee3c860c5')
b2sums=('a79bf0c95fdc040944cea0e274427e4be5a073bbe565ada86ad13577a30f7d799a5f9742691733b0d6a2716245144ff7a265ed3f5f5fde4367d6d5914c33373b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
