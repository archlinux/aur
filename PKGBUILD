# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Preproc
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automated Affymetrix Array Analysis Preprocessing Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c3c7de8edf416208d1f345499bf781f1')
b2sums=('9eabd041dd02aaa72f94ef4851d23b2e271a5237ba5f34fc85412b862c546c5ca45212b4b04e68070e2db66ce22f2fa4b361c3a2dea3048c784a714eee28559b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
