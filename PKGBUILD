# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetaboCoreUtils
_pkgver=1.16.0
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
md5sums=('dfa93fb45e53936933011982daae2a5d')
b2sums=('43518b8a0054166dd5196ee5a5ed46c00e24de4cb24a462321257fe7b242fe0139a2bc189332ebee963a00305e0bb93bb78f1176a51a950283e5c0172939b734')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
